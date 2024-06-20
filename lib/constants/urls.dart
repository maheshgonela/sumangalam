

import 'package:sumangalam/core/di/injector.dart';

final _reqisteredUrl = $sl.get<Urls>(instanceName: 'baseUrl');

class Urls {
  
  factory Urls.sumUAT() => const Urls('https://testsumangalam.easycloud.co.in/api');


  const Urls(this.url);

  final String url;

  static const isTest = true;

  static final baseUrl = _reqisteredUrl.url;
  static final jsonWs = '$baseUrl/resource';
  static final cusWs = '$baseUrl/method';

  static final login = '$cusWs/login';
  static final getUsers = '$cusWs/easygateentry.api.getUsers';

}