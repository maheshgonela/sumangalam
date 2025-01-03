import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sumangalam/app/presentation/app_home_page.dart';
import 'package:sumangalam/app/presentation/app_profile_page.dart';
import 'package:sumangalam/app/presentation/app_splash_scrn.dart';
import 'package:sumangalam/app/widgets/scaffold_with_bottom_nav_bar.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/cubit/location/geo_location_cubit.dart';
import 'package:sumangalam/core/di/injector.dart';
import 'package:sumangalam/core/model/pair_triple.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/features/auth/presentation/ui/authentication_scrn.dart';
import 'package:sumangalam/features/gate_entry/model/new_gate_entry_form.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry/new_gate_entry_cubit.dart';
import 'package:sumangalam/features/gate_entry/presentation/ui/create/new_gate_entry.dart';
import 'package:sumangalam/features/gate_entry/presentation/ui/entries/gate_entry_list.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/bloc_providers.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit/new_gate_exit_cubit.dart';
import 'package:sumangalam/features/gate_exit/presentation/ui/create/new_gate_exit.dart';
import 'package:sumangalam/features/gate_exit/presentation/ui/exits/gate_exit_list.dart';
import 'package:sumangalam/features/hr/model/request_params.dart';
import 'package:sumangalam/features/hr/presentation/bloc/hr_bloc_provider.dart';
import 'package:sumangalam/features/hr/presentation/bloc/new_on_duty/new_on_duty_cubit.dart';
import 'package:sumangalam/features/hr/presentation/ui/attendance_approval/attendance_app_scrn.dart';
import 'package:sumangalam/features/hr/presentation/ui/hr_main_page.dart';
import 'package:sumangalam/features/hr/presentation/ui/on_auty_approval/on_duty_app_scrn.dart';
import 'package:sumangalam/features/hr/presentation/ui/on_duty/create_on_duty_scrn.dart';
import 'package:tuple/tuple.dart';

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
                          final name = (form as GateEntryForm?)?.gateEntryNo;

                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (_) => $sl.get<NewGateEntryCubit>()..init(state.extra)),
                              if (name.isNotNull) ...[
                                BlocProvider(
                                  create: (_) => GateEntryBlocProvider.instance().fetchAttachments()..request(name)),
                              ] else ...[
                                BlocProvider(
                                  create: (_) => GateEntryBlocProvider.instance().fetchAttachments()),
                              ],
                            ],
                            child: const NewGateEntry(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(RoutePath.gateExit),
                    builder: (context, state) => const GateExitListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(RoutePath.newGateExit),
                        builder: (context, state) {
                          final form = state.extra;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (_) => $sl.get<NewGateExitCubit>()..init(form)),
                              BlocProvider(
                                create: (_) => GateExitBlocProvider.instance().salesInvoice()),
                            ],
                            child: const NewGateExitScrn(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(RoutePath.hr),
                    builder: (_, state) => const HRMainPage(),
                    routes: [
                      GoRoute(
                        path: _getPath(RoutePath.onduty),
                        builder: (_, state) => MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (_) => $sl.get<GeoLocationCubit>()..fetchLocation()),
                            BlocProvider(create: (_) => $sl.get<NewOnDutyCubit>()),
                          ],
                          child: const CreateOnDutyScrn(),
                        ),
                      ),
                      GoRoute(
                        path: _getPath(RoutePath.approval),
                        builder: (_, state) {
                          final provider = HRBlocProvider.get();
                   
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(create: (_) => provider.approvalList()
                                ..request(RequestParams(status: 'Draft', start: DFU.now(), end: DFU.now()))),
                              BlocProvider(create: (_) => provider.approvedList()
                                ..request(RequestParams(status: 'Rejected', start: DFU.now(), end: DFU.now()))),
                                  BlocProvider(create: (_) => provider.rejectedList()
                                ..request(RequestParams(status: 'Approved', start: DFU.now(), end: DFU.now()))),
                              BlocProvider(create: (_) => provider.approveReqs()),
                            ], 
                            child:  const OnDutyApprovalScrn(),
                          );
                        }
                      ),
                      GoRoute(
                        path: _getPath(RoutePath.attendance),
                        builder: (_, state) {
                          final provider = HRBlocProvider.get();
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(create: (_) => provider.draftAttendace()
                                ..request(Pair(DFU.now(), DFU.now()))),
                              BlocProvider(create: (_) => provider.approvedAttendance()
                                ..request(Pair(DFU.now(), DFU.now()))),

                              BlocProvider(create: (_) => provider.approveReqs()),
                            ], 
                            child: const AttendanceAppScrn(),
                          );
                        }
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
