import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/network/api_client.dart';
import 'package:sumangalam/core/network/api_response.dart';
import 'package:sumangalam/core/network/exception.dart';
import 'package:sumangalam/core/network/request_config.dart';
import 'package:sumangalam/features/auth/model/logged_in_user.dart';

typedef ApiCall<T> = Future<ApiResponse<T>> Function(RequestConfig<T> config);
typedef StandardApiResponse<T> = Future<Either<Failure, ApiResponse<T>>>;

class BaseApiRepository {
  const BaseApiRepository(this.client);

  final ApiClient client;

  StandardApiResponse<T> get<T>(RequestConfig<T> params,{bool includeAuthHeader = true}) async {
    try {
      return _request(client.get, params, includeAuthHeader: includeAuthHeader);
    } on Exception catch (e, st) {
      $logger.error('[Api Failure]', e, st);
      return left(Failure(error: e.toString()));
    }
  }

  StandardApiResponse<T> post<T>(
    RequestConfig<T> params, {
    bool includeAuthHeader = true,
  }) async => _request(client.post, params, includeAuthHeader: includeAuthHeader);

  StandardApiResponse<T> multiPart<T>(
    RequestConfig<T> params, {
    bool includeAuthHeader = true,
  }) async {
    return _request(client.multipartRequest, params, includeAuthHeader: includeAuthHeader);
  }

  StandardApiResponse<T> _request<T>(ApiCall<T> apiCall, RequestConfig<T> config, {bool includeAuthHeader = true}) async {
    try {
      final commonHeaders = <String,dynamic>{HttpHeaders.contentTypeHeader : 'application/json'};
      if(includeAuthHeader) {
        final cookie = await _getAuthCookie();
        commonHeaders.addAll(cookie);
      }
      final RequestConfig<T> requestConfig = config.copyWith(
        headers: {...config.headers ?? {}, ...commonHeaders},
      );

      final ApiResponse<T> response = await apiCall(requestConfig);
      if (response.isFailed()) {
        return left(Failure(error: response.error!, ));
      }

      return right(response);
    } on BaseApiException catch (e, st) {
      $logger.error(e.toString(), e, st);

      return left(Failure(error: e.message));
    } on Exception catch (e, st) {
      $logger.error(e.toString(), e, st);

      return left(Failure(error: e.toString()));
    }
  }

  Future<Map<String,dynamic>> _getAuthCookie() async {
    final apiKey = user().apiKey;
    final apiSecret = user().apiSecret;
    if(apiKey.doesNotHaveValue || apiSecret.doesNotHaveValue) return {};

    return {HttpHeaders.authorizationHeader : 'token $apiKey:$apiSecret'};
  }

  LoggedInUser user() => $sl.get<LoggedInUser>();
}
