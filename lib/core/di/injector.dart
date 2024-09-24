import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injector.config.dart';

final $sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies({required String env}) async {
  await $sl.init(environment: env);

  $sl.registerSingleton(env, instanceName: 'env');
}

@module
abstract class ThirdPartyDependencies {
  @singleton
  Dio get dio => Dio();

  @singleton
  Connectivity get connectivity => Connectivity();

  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @singleton
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @factory
  DateTime get defaultDateTime => DateTime.now();
}

Future<void> register<T extends Object>(T value,{String? instanceName}) async {
  if ($sl.isRegistered<T>()) {
    await $sl.unregister<T>();
  }

  $sl.registerSingleton(value,instanceName: instanceName);
}
