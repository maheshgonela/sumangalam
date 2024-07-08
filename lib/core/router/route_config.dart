import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sumangalam/app/presentation/app_home_page.dart';
import 'package:sumangalam/app/presentation/app_profile_page.dart';
import 'package:sumangalam/app/presentation/app_splash_scrn.dart';
import 'package:sumangalam/app/widgets/scaffold_with_bottom_nav_bar.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/features/auth/presentation/ui/authentication_scrn.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry/new_gate_entry_cubit.dart';
import 'package:sumangalam/features/gate_entry/presentation/ui/create/new_gate_entry.dart';
import 'package:sumangalam/features/gate_entry/presentation/ui/entries/gate_entry_list.dart';

class AppRouterConfig {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final getCurrContext = parentNavigatorKey.currentContext;
  static final _sectionNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: RoutePath.splash.path,
    routes: [
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
          return ScaffoldWithBottomNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: [
              GoRoute(
                path: RoutePath.home.path,
                builder: (_, state) => const AppHomePage(),
                routes: [
                  GoRoute(
                    path: _getPath(RoutePath.gateEntry),
                    builder: (context, state) => const GateEntryListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(RoutePath.newGateEntry),
                        builder: (context, state) {
                          final form = state.extra;
                          String? name;
                          if(form is GateEntryForm) {
                            name = form.gateEntryNo;
                          }
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(create: (context) => $sl.get<NewGateEntryCubit>()..init(state.extra)),
                              if(name.isNotNull)...[
                                BlocProvider(create: (_) => GateEntryBlocProvider.instance().fetchAttachments()..request(name)),
                              ] else...[
                                BlocProvider(create: (_) => GateEntryBlocProvider.instance().fetchAttachments()),
                              ],
                            ],
                            child: const NewGateEntry(),
                          );
                        },
                      ),
                    ],
                  ),
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

  static String _getPath(RoutePath route) => route.path.split('/').last;
}
