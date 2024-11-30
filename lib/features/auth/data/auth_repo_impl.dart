import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/constants/urls.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/network/base_api_repo.dart';
import 'package:sumangalam/core/network/request_config.dart';
import 'package:sumangalam/core/network/response_parser.dart';
import 'package:sumangalam/features/auth/data/auth_repo.dart';
import 'package:sumangalam/features/auth/model/logged_in_user.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends BaseApiRepository implements AuthRepo {
  const AuthRepoImpl(super.client, this.storage);

  final KeyValueStorage storage;

  @override
  Future<bool> isLoggedIn() async {
    try {
      final user = await storage.getSecureString(LocalKeys.user);
      return (user.containsValidValue && json.decode(user!) is Map);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not check for persisted user', e, st);
      return false;
    }
  }
    @override
  AsyncValueOf<LoggedInUser> logIn(String username, String pswd) async {
    final requestConfig = RequestConfig(
      url: Urls.login,
      parser: (res) => LoggedInUser.fromJson(res),
      body: jsonEncode({'usr' : username, 'pwd' : pswd}),
    );

    final response = await post(requestConfig, includeAuthHeader: false);

    return response.processAsync((r) async {
      if (r.data.isNull) {
        return Errors.unauthorized.asFailure();
      }
      final userWithPswd = r.data!.copyWith(
        password: pswd, 
        email: username,
      );
      await _persistUser(userWithPswd);
      await storage.setString(LocalKeys.apiKey, userWithPswd.apiKey);
      await storage.setString(LocalKeys.apiSecret, userWithPswd.apiSecret);
      return right(userWithPswd);
    });
  }
    Future<Either<Failure, bool>> _persistUser(LoggedInUser user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await storage.setSecureString(LocalKeys.user, userJson);

      return right(true);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not persisted user', e, st);
      return left(const Failure(error: 'Something went wrong'));
    }
  }

  @override
  AsyncValueOf<LoggedInUser> getPersistedUser() async {
    try {
      final userSource = await storage.getSecureString(LocalKeys.user);
      if (userSource.doesNotHaveValue) {
        return left(const Failure(error: 'No user details found'));
      }
      final userData = jsonDecode(userSource!) as Map<String, dynamic>;
      final user = LoggedInUser.fromJson(userData);
      return right(user);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not get persisted user', e, st);
      return left(const Failure(error: 'Something went wrong'));
    }
  }
  @override
  AsyncValueOf<bool> signOut() async {
    try {
      await storage.clearAllValues();
      await storage.clearAllSecureValues();
      return right(true);
    } on Exception catch (e, st) {
      $logger.error('[repo] could not sign out user', e, st);
      return left(const Failure(error: 'Could not sign out'));
    }
  }
}
