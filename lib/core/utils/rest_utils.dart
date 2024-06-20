import 'dart:convert';

import 'package:sumangalam/core/core.dart';

class RestUtils {
  static Uri constructUri(String baseUrl, [Map<String, dynamic>? params]) {
    final url = baseUrl.replaceAll('https://', '');
    final authority =
        url.indexOf('/') > 0 ? url.substring(0, url.indexOf('/')) : url;
    final path = url == authority ? '' : url.substring(url.indexOf('/'));

    final Map<String, String> urlParams = {};

    params?.forEach((key, value) {
      urlParams[key] = value.toString();
    });

    return Uri.https(authority, path, urlParams);
  }

  static String encodeParams(Map<String, String> params) {
    var s = '';
    params.forEach((key, value) {
      if (value.isNotEmpty && value != 'null') {
        final urlEncode = Uri.encodeComponent(value);
        s += '${s == '' ? '?' : '&'}$key=$urlEncode';
      }
    });

    return s;
  }

  static String basicAuth(String username, String password) {
    assert(username.isNotEmpty, 'Username can not be empty');
    assert(password.isNotEmpty, 'Password can not be empty');

    return 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  }

  static String withAnd(List<String> values) =>
      values.where((element) => element.containsValidValue).join(' and ');
  static String withOr(List<String> values) =>
      values.where((element) => element.containsValidValue).join(' or ');
}
