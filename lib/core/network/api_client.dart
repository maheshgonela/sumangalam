import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/network/api_response.dart';
import 'package:sumangalam/core/network/error_pasrser.dart';
import 'package:sumangalam/core/network/exception.dart';
import 'package:sumangalam/core/network/internet_check.dart';
import 'package:sumangalam/core/network/request_config.dart';
import 'package:sumangalam/core/network/response_parser.dart';

/// A class which is responsible to make actual api calls and provide [ApiResponse]s.
///
@injectable
class ApiClient {
  const ApiClient(this.client, this.internet);

  /// HTTPClient that is going to be used to make underlying api calls. It can be easily switched
  /// any other implementations like dio.
  final http.Client client;

  /// Internet checker
  final InternetConnectionChecker internet;

  /// Performs HTTP GET request with provided request configuration
  Future<ApiResponse<T>> get<T>(RequestConfig<T> params) async {
    return _request(
      (Uri urlWithParams) => client.get(urlWithParams, headers: params.headers),
      params,
    );
  }


  /// Performs HTTP POST request with provided request configuration
  Future<ApiResponse<T>> post<T>(RequestConfig<T> params) async {
    return _request(
      (Uri urlWithParams) => client.post(urlWithParams, headers: params.headers, body: params.body),
      params,
    );
  }

  Future<ApiResponse<T>> formRequest<T>(RequestConfig<T> params) async {
    return _request(
      (Uri urlWithParams) => client.post(urlWithParams, headers: params.headers, body: jsonDecode(params.body!)),
      params,
    );
  }

  /// Performs HTTP POST request with provided request configuration
  Future<ApiResponse<T>> formUrlEncodeRequest<T>(RequestConfig<T> params) async {
    return _request(
      (Uri urlWithParams) => client.post(
        urlWithParams, 
        headers: {
          ...params.headers ?? {},
        }, 
        body: params.body,
        // encoding: Encoding.getByName('utf-8')
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
        final http.MultipartRequest request = http.MultipartRequest('POST', urlWithParams);
        final Map<String, String>? headers = params.headers;
        final Map<String, dynamic>? reqParams = params.reqParams;

        if (headers != null) {
          request.headers.addAll(headers);
        }

        if (reqParams != null) {
          for (final MapEntry<String, dynamic> param in reqParams.entries) {
            if (param.value is File?) {
               final originalFile = param.value as File;
              final file = await http.MultipartFile.fromPath(param.key, originalFile.path);
              request.files.add(file);
            } else {
              request.fields.putIfAbsent(param.key, () => param.value);
            }
          }
        }
        final http.StreamedResponse streamedResponse =
            await client.send(request);

        return http.Response.fromStream(streamedResponse);
      },
      params,
    );
  }

  Future<ApiResponse<T>> _request<T>(
    Future<http.Response> Function(Uri url) apiCall,
    RequestConfig<T> params,
  ) async {
    try {
      if (!await internet.hasInternet()) {
        throw NoInternetException(Errors.noInternet);
      }

      final Uri uri = RestUtils.constructUri(params.url, params.reqParams);
      final http.Response httpResponse = await apiCall(uri);
      final int statusCode = httpResponse.statusCode;
      final String resBody = httpResponse.body;
      
      if (kDebugMode) {
        print(params);
        final modifiedParams = {...params.reqParams ?? {}};
        modifiedParams.removeWhere((key, value) {
          if(key == 'file' && kDebugMode) $logger.devLog(value);
          return key == 'file';
        });
        $logger
          ..info(uri)
          ..info(params.body ?? modifiedParams)
          ..info('Status Code $statusCode')
          ..info('Response : $resBody');
      }

      if (statusCode == HttpStatus.ok) {
        if (resBody.doesNotHaveValue) {
          throw UnExpectedResponseException(resBody);
        }

        final ApiResponseParser<T> responseParser = params.apiResponseParser ?? FrappeApiResponseParser<T>();
        final ApiResponse<T> result = responseParser.parse(
          resBody,
          params.parser,
          Errors.defaultApiErrorMessage,
        );

        return result;
      } else {
        if (statusCode == HttpStatus.unauthorized || statusCode <= HttpStatus.internalServerError) {
          final res = defaultErrorParser(jsonDecode(resBody), Errors.invalidcredentials);
          throw BaseApiException(res.error);
        } else if (statusCode >= HttpStatus.badRequest &&
            statusCode <= HttpStatus.clientClosedRequest) {
          throw ClientException(Errors.clientError);
        } else if ( statusCode <= HttpStatus.networkConnectTimeoutError) {
          throw ServerException(Errors.internalServerError);
        } else {
          throw UnknownException(Errors.unknown);
        }
      }
    } on SocketException catch(e,st) {
      $logger.error('[API client SocketException]',e, st);
      throw ConnectionException(Errors.connectionIssue);
    } on FormatException catch (e) {
      throw ParseException(e.message);
    } on Exception catch (e, st) {
      $logger.error('[API client SocketException]',e, st);
      if (e is NoInternetException ||
          e is BaseApiException ||
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
