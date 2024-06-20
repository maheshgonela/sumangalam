import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sumangalam/app/presentation/app_home_page.dart';
import 'package:sumangalam/app/presentation/app_profile_page.dart';
import 'package:sumangalam/app/presentation/app_splash_scrn.dart';
import 'package:sumangalam/app/widgets/initial_scaffold_with_bottom_nav_bar.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/features/auth/presentation/ui/authentication_scrn.dart';
import 'package:sumangalam/features/gateEntry/presentation/ui/create/cubit/new_gate_entry_cubit.dart';
import 'package:sumangalam/features/gateEntry/presentation/ui/create/new_gate_entry.dart';
import 'package:sumangalam/features/gateEntry/presentation/ui/gate_entry_list.dart/gate_entry_list.dart';

class AppRouterConfig {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final _sectionNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: RoutePath.splash.path,
    routes: <RouteBase>[
      GoRoute(
        path: RoutePath.splash.path,
        builder: (_, state) => const AppSplashScreen(),
      ),
      GoRoute(
        path: RoutePath.login.path,
        builder: (_, state) => const AuthenticationScrn(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return InitialScaffoldWithBottomNavBar(
              navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: RoutePath.home.path,
                builder: (_, state) => const AppHomePage(),
                routes: [
                  GoRoute(
                      path: 'gateEntry',
                      builder: (context, state) => const GateEntryListScrn(),
                      routes: [
                        GoRoute(
                          path: 'newGateEntry',
                          builder: (context, state) {
                            return BlocProvider(
                              create: (context) => $sl.get<NewGateEntryCubit>(),
                              child: const NewGateEntry(),
                            );
                          },
                        ),
                      ]),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePath.profile.path,
                builder: (_, state) => const AppProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
