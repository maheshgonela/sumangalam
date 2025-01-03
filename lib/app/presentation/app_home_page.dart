import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/app/widgets/app_feature_widget.dart';
import 'package:sumangalam/app/widgets/app_page_view.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/bloc_provider.dart';

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      mode: PageMode.home,
      child: Center(
        child: BlocBuilder<AccessibleFeatues, AccessibleFeatuesState>(
          builder: (_, state) {
            return state.maybeWhen(
              orElse: () => const AppLoadingIndicator(),
              failure: (failure) => AppFailureWidget(
                errorMsg: failure.error,
                retry: context.cubit<AccessibleFeatues>().request,
              ),
              success: (data) {
                if(data.isEmpty) {
                  return AppFailureWidget(
                    errorMsg: "You currently don't have access to mobile features. Please check your permissions or contact support for assistance.",
                    retry: context.cubit<AccessibleFeatues>().request,
                  );
                }
                final hrFeatures = [
                  'Attendance',
                  'On Duty Approval',
                  'Attendance Approval'
                ];
                final hasHRAccess = hrFeatures.any((e) => data.contains(e));
                return GridView.count(
                  padding: const EdgeInsets.all(8.0),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 1,
                  children: [
                    if (!data.contains('Gate Entry')) ...[
                      AppFeatureWidget(
                        icon: Image.asset(
                          AppIcons.vehicleIn.path,
                          fit: BoxFit.contain,
                        ),
                        title: 'Gate Entry',
                        featureColor: AppColors.cobaltBlue,
                        onTap: () => RoutePath.gateEntry.push(context),
                      ),
                    ],
                    if (!data.contains('Gate Exit')) ...[
                      AppFeatureWidget(
                        icon: Image.asset(
                          AppIcons.vehicleOut.path,
                          fit: BoxFit.contain,
                        ),
                        title: 'Gate Exit',
                        featureColor: AppColors.defaultTextColor,
                        onTap: () => RoutePath.gateExit.push(context),
                      ),
                    ],
                    // if (hasHRAccess)...[
                      AppFeatureWidget(
                        icon: Image.asset(
                          AppIcons.empSearch.path,
                          fit: BoxFit.contain,
                        ),
                        title: 'HR',
                        featureColor: AppColors.normal,
                        onTap: () => RoutePath.hr.push(context),
                      ),
                    ],
                  // ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
