import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sumangalam/core/base/base_cubit.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/logger/app_logger.dart';
import 'package:sumangalam/features/auth/data/auth_repo.dart';
import 'package:sumangalam/features/auth/model/logged_in_user.dart';


part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends AppBaseCubit<AuthState> {
  AuthCubit(this.repo) : super(const AuthState.loading());

  final AuthRepo repo;

  void authCheckRequested() async {
    emitSafeState(const _Loading());
    try {  
      final isloggedIn = await repo.isLoggedIn();
      if (!isloggedIn) {
        emitSafeState(const _UnAuthenticated());
        print('afhjbdj');
        return;
      }

      final user = await repo.getPersistedUser();
      user.fold(
        (l) => emitSafeState(const _UnAuthenticated()),
        (r) async {
          await register<LoggedInUser>(r);
          print('object');
          // await OneSignal.User.pushSubscription.optIn();
          emitSafeState(const _Authenticated());
        },
      );
    } on Exception catch (e,st) {
      $logger.error('[AuthCheck Exception]',e,st);
      emitSafeState(const _UnAuthenticated()); 
    }
  }

  void signOut() async {
    try {
      emitSafeState(const _Loading());
      // await OneSignal.User.pushSubscription.optOut();
      await repo.signOut();
      await $sl.unregister<LoggedInUser>();
      emitSafeState(const _UnAuthenticated());
    } on Exception catch (e,st) {
      $logger.error('[Auth Cubit] cant able to logout', e,st);
      emitSafeState(const _UnAuthenticated());
    }
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unAuthenticated() = _UnAuthenticated;
}
