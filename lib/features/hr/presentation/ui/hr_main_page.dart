import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/app/widgets/app_feature_widget.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/bloc_provider.dart';

class HRMainPage extends StatelessWidget {
  const HRMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'HR - On Duty Authentication',
        textColor: AppColors.cobaltBlue,
      ),
      body: BlocBuilder<AccessibleFeatues, AccessibleFeatuesState>(
        builder: (_, state) {
          final features = state.maybeWhen(
            orElse: () => <String>[],
            success: (data) => data,
          );
          return SpacedColumn(
            margin: const EdgeInsets.all(12.0),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if(features.contains('Attendance'))...[
                    Expanded(
                      child: AppFeatureWidget(
                        icon: Image(
                          image: AssetImage(AppIcons.jobSearch.path),
                          fit: BoxFit.fill,
                          height: 64,
                        ),
                        title: 'On Duty',
                        featureColor: AppColors.blue,
                        onTap: () => RoutePath.onduty.go(context),
                      ),
                    ),
                    AppSpacer.p8(),
                  ],
                  if(features.contains('On Duty Approval'))...[
                    Expanded(
                      child: AppFeatureWidget(
                        icon: const Icon(Icons.checklist_outlined,
                            color: AppColors.white, size: 64),
                        featureColor: AppColors.warning,
                        title: 'On Duty Approval',
                        onTap: () => RoutePath.approval.go(context),
                      ),
                    ),
                  ],
                ],
              ),
              if(features.contains('Attendance Approval'))...[
                AppSpacer.p12(),
                const CaptionText(title: 'Attendance Approval'),
                Row(
                  children: [
                    Expanded(
                      child: AppFeatureWidget(
                        icon: const Icon(Icons.group,
                            color: AppColors.white, size: 64),
                        featureColor: AppColors.kashmirBlue,
                        title: 'Attendance Approval',
                        onTap: () => RoutePath.attendance.go(context),
                      ),
                    ),
                    AppSpacer.p8(),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
