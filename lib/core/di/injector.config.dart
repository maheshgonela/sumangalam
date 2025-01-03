// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/auth_repo.dart' as _i585;
import '../../features/auth/data/auth_repo_impl.dart' as _i328;
import '../../features/auth/presentation/bloc/auth/auth_cubit.dart' as _i190;
import '../../features/auth/presentation/bloc/sign_in/sign_in_cubit.dart'
    as _i140;
import '../../features/gate_entry/data/gate_entry_api_helper.dart' as _i830;
import '../../features/gate_entry/data/gate_entry_repo.dart' as _i820;
import '../../features/gate_entry/data/gate_entry_repo_impl.dart' as _i174;
import '../../features/gate_entry/presentation/bloc/bloc_provider.dart'
    as _i210;
import '../../features/gate_entry/presentation/bloc/gate_entry/new_gate_entry_cubit.dart'
    as _i465;
import '../../features/gate_exit/data/gate_exit_repo.dart' as _i495;
import '../../features/gate_exit/data/gate_exit_repo_impl.dart' as _i100;
import '../../features/gate_exit/presentation/bloc/bloc_providers.dart'
    as _i493;
import '../../features/gate_exit/presentation/bloc/gate_exit/new_gate_exit_cubit.dart'
    as _i469;
import '../../features/hr/data/hr_repo.dart' as _i396;
import '../../features/hr/data/hr_repo_impl.dart' as _i866;
import '../../features/hr/presentation/bloc/hr_bloc_provider.dart' as _i712;
import '../../features/hr/presentation/bloc/new_on_duty/new_on_duty_cubit.dart'
    as _i769;
import '../core.dart' as _i351;
import '../cubit/location/geo_location_cubit.dart' as _i519;
import '../local_storage/key_vale_storage.dart' as _i1012;
import '../logger/app_logger.dart' as _i293;
import '../network/api_client.dart' as _i557;
import '../network/internet_check.dart' as _i402;
import '../network/network.dart' as _i855;
import 'injector.dart' as _i811;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyDependencies = _$ThirdPartyDependencies();
    gh.factory<_i519.GeoLocationCubit>(() => _i519.GeoLocationCubit());
    gh.factory<DateTime>(() => thirdPartyDependencies.defaultDateTime);
    gh.singleton<_i361.Dio>(() => thirdPartyDependencies.dio);
    gh.singleton<_i895.Connectivity>(() => thirdPartyDependencies.connectivity);
    gh.singleton<_i558.FlutterSecureStorage>(
        () => thirdPartyDependencies.secureStorage);
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => thirdPartyDependencies.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i402.InternetConnectionChecker>(
        () => _i402.InternetConnectionChecker(gh<_i895.Connectivity>()));
    gh.factory<_i293.AppLogger>(
      () => _i293.AppLogger(),
      instanceName: 'app_logger',
    );
    gh.factory<_i1012.KeyValueStorage>(() => _i1012.KeyValueStorage(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i557.ApiClient>(() => _i557.ApiClient(
          gh<_i361.Dio>(),
          gh<_i855.InternetConnectionChecker>(),
        ));
    gh.lazySingleton<_i585.AuthRepo>(() => _i328.AuthRepoImpl(
          gh<_i557.ApiClient>(),
          gh<_i351.KeyValueStorage>(),
        ));
    gh.factory<_i190.AuthCubit>(() => _i190.AuthCubit(gh<_i585.AuthRepo>()));
    gh.factory<_i140.SignInCubit>(
        () => _i140.SignInCubit(gh<_i585.AuthRepo>()));
    gh.lazySingleton<_i820.GateEntryRepo>(
        () => _i174.GateEntryRepoImpl(gh<_i855.ApiClient>()));
    gh.singleton<_i495.GateExitRepo>(
        () => _i100.GateExitRepoImpl(gh<_i855.ApiClient>()));
    gh.lazySingleton<_i396.HRRepo>(
        () => _i866.HRRepoImpl(gh<_i855.ApiClient>()));
    gh.factory<_i769.NewOnDutyCubit>(
        () => _i769.NewOnDutyCubit(gh<_i396.HRRepo>()));
    gh.factory<_i469.NewGateExitCubit>(
        () => _i469.NewGateExitCubit(gh<_i495.GateExitRepo>()));
    gh.factory<_i712.HRBlocProvider>(
        () => _i712.HRBlocProvider(repo: gh<_i396.HRRepo>()));
    gh.factory<_i493.GateExitBlocProvider>(
        () => _i493.GateExitBlocProvider(repo: gh<_i495.GateExitRepo>()));
    gh.factory<_i465.NewGateEntryCubit>(
        () => _i465.NewGateEntryCubit(gh<_i820.GateEntryRepo>()));
    gh.factory<_i210.GateEntryBlocProvider>(
        () => _i210.GateEntryBlocProvider(repo: gh<_i820.GateEntryRepo>()));
    gh.factory<_i830.PurchaseOrderHelper>(
        () => _i830.PurchaseOrderHelper(repo: gh<_i820.GateEntryRepo>()));
    gh.factory<_i830.SupplierListHelper>(
        () => _i830.SupplierListHelper(repo: gh<_i820.GateEntryRepo>()));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i811.ThirdPartyDependencies {}
