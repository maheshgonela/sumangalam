import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/network/network.dart';

/// A class which is responsible to make actual api calls and provide [ApiResponse]s.
///
@injectable
class ApiClient {
  const ApiClient(this.client, this.internet);

  /// HTTPClient that is going to be used to make underlying api calls. It can be easily switched
  /// any other implementations like dio.
  final Dio client;

  /// Internet checker
  final InternetConnectionChecker internet;

  /// Performs DIO GET request with provided request configuration
  Future<ApiResponse<T>> get<T>(RequestConfig<T> params) async {
    return _request(
      (Uri urlWithParams) => client.getUri(urlWithParams,
          options: Options(headers: params.headers)),
      params,
    );
  }

  /// Performs DIO POST request with provided request configuration
  Future<ApiResponse<T>> post<T>(RequestConfig<T> params) async {
    return _request(
      (Uri urlWithParams) => client.postUri(urlWithParams,
          options: Options(
            headers: params.headers,
          ),
          data: params.body),
      params,
    );
  }

  Future<ApiResponse<T>> formRequest<T>(RequestConfig<T> params) async {
    return _request(
      (Uri urlWithParams) => client.postUri(
        urlWithParams,
        options: Options(
            headers: params.headers
              ?..putIfAbsent('Content-Type', () => 'multipart/form-data'),
            contentType: 'multipart/form-data'),
        data: params.body,
      ),
      params,
    );
  }

  /// Performs HTTP POST-multipart-request body request with provided request configuration
  /// Note: This method is supposed to be used for uploading files only as of now because few
  /// keys have been hardcoded in the implementation.
  ///
  /// It can be easily extended to make a customized request
  Future<ApiResponse<T>> multipartRequest<T>(RequestConfig<T> params) async {
    return _request(
      (Uri urlWithParams) async {
        final Map<String, String>? headers = params.headers;
        final Map<String, dynamic>? reqParams = params.reqParams;
        final FormData formData = FormData.fromMap(reqParams!);

        if (reqParams.isNotEmpty) {
          for (final MapEntry<String, dynamic> param in reqParams.entries) {
            if (param.value is File?) {
              final File originalFile = param.value as File;
              await _addFileToRequest(param.key, originalFile, formData);
            } else {
              if (!formData.fields.contains(MapEntry(param.key, param.value))) {
                formData.fields.add(MapEntry(param.key, param.value));
              }
            }
          }
        }
        final header = {...headers ?? {}};
        final Response response = await client.postUri(urlWithParams,
            data: formData,
            options: Options(
              headers: header
                ..putIfAbsent('Content-Type', () => 'multipart/form-data'),
              contentType: 'multipart/form-data',
            ));
        return response;
      },
      params,
    );
  }

  Future<void> _addFileToRequest(String key, File? file, FormData form) async {
    if (file != null) {
      final multipartFile =
          MapEntry(key, await MultipartFile.fromFile(file.path));
      form.files.add(multipartFile);
    }
  }

  Future<ApiResponse<T>> _request<T>(
    Future<Response<dynamic>> Function(Uri url) apiCall,
    RequestConfig<T> params,
  ) async {
    $logger.info(params.headers);
    $logger.info(params.reqParams);
    try {
      if (!await internet.hasInternet()) {
        throw NoInternetException(Errors.noInternet);
      }

      final uri = RestUtils.constructUri(params.url, params.reqParams);
      final dioResponse = await apiCall(uri);
      $logger.info('Res: ${dioResponse.data}');
      $logger.info('Code: ${dioResponse.statusMessage}');
      final statusCode = dioResponse.statusCode!;
      if (dioResponse.data == null) {
        throw UnExpectedResponseException(Errors.unknown);
      }
      final resBody = dioResponse.data as Map<String, dynamic>;
      if (kDebugMode) {
        $logger
          ..info(uri)
          ..info(params.body ?? params.reqParams)
          ..info(params.headers)
          ..info('Status Code $statusCode')
          ..info('Response : $resBody');
      }

      if (statusCode == HttpStatus.ok) {
        if (resBody.isEmpty) {
          throw UnExpectedResponseException(Errors.unknown);
        }

        final ApiResponseParser<T> responseParser =
            params.apiResponseParser ?? FrappeApiResponseParser<T>();
        final ApiResponse<T> result = responseParser.parse(
          jsonEncode(resBody),
          params.parser,
          Errors.defaultApiErrorMessage,
        );

        return result;
      } else {
        if (statusCode == HttpStatus.gatewayTimeout) {
          throw ServerException(Errors.gatewayTimeout);
        } else if (statusCode == HttpStatus.unauthorized) {
          throw ServerException(Errors.invalidcredentials);
        } else if ((statusCode >= HttpStatus.internalServerError &&
                statusCode <= HttpStatus.networkConnectTimeoutError) ||
            statusCode == HttpStatus.expectationFailed) {
          final message =
              defaultErrorParser(resBody, Errors.internalServerError);
          throw ServerException(message);
        } else if (statusCode >= HttpStatus.badRequest &&
            statusCode <= HttpStatus.clientClosedRequest) {
          throw ClientException(Errors.clientError);
        } else {
          throw UnknownException(Errors.unknown);
        }
      }
    } on DioException catch (e, _) {
      final response = e.response?.data;
      if(response is Map<String,dynamic>) {
        final message = defaultErrorParser(response, Errors.internalServerError);
        throw ServerException(message);
      }
      final errorMsg = e.message;
      $logger.info(errorMsg);
      if(errorMsg != null) {
        throw UnknownException(errorMsg.toString());
      }
      throw UnknownException(Errors.unknown);
    } on ServerException catch (e, _) {
      throw BaseApiException(e.message);
    } on FormatException catch (e) {
      throw ParseException(e.message);
    } on Exception catch (e, st) {
      $logger.error('[API client SocketException]', e, st);
      if (e is NoInternetException ||
          e is UnExpectedResponseException ||
          e is UnAuthorizedException ||
          e is ClientException ||
          e is ServerException) {
        rethrow;
      }
      throw UnknownException(Errors.unknown);
    }
  }
}
