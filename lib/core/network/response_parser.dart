import 'dart:convert';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/network/api_response.dart';

typedef ApiObjectParser<T> = T Function(Map<String, dynamic>);

abstract class ApiResponseParser<T> {
  ApiResponse<T> parse(
      String response, ApiObjectParser<T> parser, String defErrorMessage);
}

class FrappeApiResponseParser<T> implements ApiResponseParser<T> {
  @override
  ApiResponse<T> parse(
    String apiResponse,
    ApiObjectParser<T> parser,
    String defErrorMessage,
  ) {
    try {
      final Map<String, dynamic> response =
          json.decode(apiResponse) as Map<String, dynamic>;
      final message = response['message'];
      if (message is List<dynamic>) {
        final res = parser(response);
        return ApiResponse.success(res);
      }

      final messageObj = response['message'];
      if (messageObj is Map<String, dynamic>) {
        $logger.info('messageObj $messageObj');

        final status = messageObj['status_code'];
        final message = messageObj['message'];

        print('Status: $status, Message: $message');

        if (status == 400) {
          return ApiResponse.failure(message, status: status);
        } else if (status == 200) {
          final result = parser(response);
          return ApiResponse.success(result);
        }
      }
      final result = parser(response);
      return ApiResponse.success(result);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

class Errors {
  static String get gatewayTimeout =>
      'Server is taking too long to respond. Please try again later.';
  static String get noInternet => 'Please check your internet connection';
  static String get emptyApiResponse => 'Received empty response from server';
  static String get defaultApiErrorMessage =>
      'Unfortunately something went wrong. Please try again a moment later';
  static String get unknown => 'Unknown error occurred';
  static String get connectionIssue =>
      'Could not connect to server. Please check your internet';
  static String get internalServerError => 'Internal Server Error';
  static String get unauthorized =>
      'Looks like you do not have access to this information';
  static String get invalidcredentials =>
      'Wrong credentials. Invalid Username or Password';
  static String get clientError =>
      'Unfortunately we could not complete the request.';
  static String get responseIsNotValidJson => 'Invalid json response';
  static String get unrecognizedResponse => 'Unsupported response format';

  // Login
  static String get invalidUser => 'Invalid User';
}
