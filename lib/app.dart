import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/core/styles/app_theme.dart';
import 'package:sumangalam/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:sumangalam/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';

class SumangalamApp extends StatelessWidget {
  const SumangalamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => $sl.get<AuthCubit>()..authCheckRequested()),
        BlocProvider<SignInCubit>(create: (_) => $sl.get<SignInCubit>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (_, state) {
              state.maybeWhen(
                orElse: () {},
                authenticated: () => RoutePath.home
                    .go(AppRouterConfig.parentNavigatorKey.currentContext!),
                unAuthenticated: () => RoutePath.login
                    .go(AppRouterConfig.parentNavigatorKey.currentContext!),
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
