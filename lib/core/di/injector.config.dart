// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../features/auth/data/auth_repo.dart' as _i14;
import '../../features/auth/data/auth_repo_impl.dart' as _i15;
import '../../features/auth/presentation/bloc/auth/auth_cubit.dart' as _i17;
import '../../features/auth/presentation/bloc/sign_in/sign_in_cubit.dart'
    as _i18;
import '../../features/gateEntry/data/gate_entry_repo.dart' as _i11;
import '../../features/gateEntry/data/gate_entry_repo_impl.dart' as _i12;
import '../../features/gateEntry/presentation/ui/create/cubit/new_gate_entry_cubit.dart'
    as _i13;
import '../core.dart' as _i16;
import '../local_storage/key_vale_storage.dart' as _i9;
import '../logger/app_logger.dart' as _i8;
import '../network/api_client.dart' as _i10;
import '../network/internet_check.dart' as _i7;
import 'injector.dart' as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyDependencies = _$ThirdPartyDependencies();
    gh.factory<DateTime>(() => thirdPartyDependencies.defaultDateTime);
    gh.singleton<_i3.Client>(() => thirdPartyDependencies.httpClient);
    gh.singleton<_i4.Connectivity>(() => thirdPartyDependencies.connectivity);
    gh.singleton<_i5.FlutterSecureStorage>(
        () => thirdPartyDependencies.secureStorage);
    await gh.singletonAsync<_i6.SharedPreferences>(
      () => thirdPartyDependencies.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i7.InternetConnectionChecker>(
        () => _i7.InternetConnectionChecker(gh<_i4.Connectivity>()));
    gh.factory<_i8.AppLogger>(
      () => _i8.AppLogger(),
      instanceName: 'app_logger',
    );
    gh.factory<_i9.KeyValueStorage>(() => _i9.KeyValueStorage(
          gh<_i5.FlutterSecureStorage>(),
          gh<_i6.SharedPreferences>(),
        ));
    gh.factory<_i10.ApiClient>(() => _i10.ApiClient(
          gh<_i3.Client>(),
          gh<_i7.InternetConnectionChecker>(),
        ));
    gh.lazySingleton<_i11.GateEntryRepo>(
        () => _i12.GateEntryRepoImpl(gh<_i10.ApiClient>()));
    gh.factory<_i13.NewGateEntryCubit>(
        () => _i13.NewGateEntryCubit(gh<_i11.GateEntryRepo>()));
    gh.lazySingleton<_i14.AuthRepo>(() => _i15.AuthRepoImpl(
          gh<_i10.ApiClient>(),
          gh<_i16.KeyValueStorage>(),
        ));
    gh.factory<_i17.AuthCubit>(() => _i17.AuthCubit(gh<_i14.AuthRepo>()));
    gh.factory<_i18.SignInCubit>(() => _i18.SignInCubit(gh<_i14.AuthRepo>()));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i19.ThirdPartyDependencies {}
