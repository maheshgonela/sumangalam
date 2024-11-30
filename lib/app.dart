import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/core/styles/app_theme.dart';
import 'package:sumangalam/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:sumangalam/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry_filter/gate_entry_filters.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/bloc_providers.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit_filter/gate_exit_filters.dart';

class SumangalamApp extends StatelessWidget {
  const SumangalamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => $sl.get<AuthCubit>()..authCheckRequested()),
        BlocProvider(create: (_) => $sl.get<SignInCubit>()),
        BlocProvider(create: (_) => GateEntryFilterCubit()),
        BlocProvider(create: (_) => GateExitFilterCubit()),
        BlocProvider(create: (_) => GateEntryBlocProvider.instance().accessibleFeat()),
        BlocProvider(create: (_) => GateEntryBlocProvider.instance().gateEntries()),
        BlocProvider(create: (_) => GateExitBlocProvider.instance().gateExits()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (_, state) {
              state.maybeWhen(
                orElse: () {},
                authenticated: () {
                  final ctxt = AppRouterConfig.getCurrContext!;
                  final filters = ctxt.read<GateEntryFilterCubit>().state;
                  final filters1 = ctxt.read<GateExitFilterCubit>().state;
                  ctxt
                    ..cubit<AccessibleFeatues>().request()
                    ..cubit<GateEntriesCubit>().fetchInitial(filters)
                    ..cubit<GateExitsCubit>().fetchInitial(filters1);
                  RoutePath.home.go(ctxt);
                },
                unAuthenticated: () => RoutePath.login.go(AppRouterConfig.getCurrContext!),
              );
            },
          ),
        ],
        child: MaterialApp.router(
          title: 'Sumangalam',
          theme: AppTheme.lightTheme,
          routerConfig: AppRouterConfig.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
