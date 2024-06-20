import 'package:flutter/material.dart';
import 'package:sumangalam/app/widgets/app_feature_widget.dart';
import 'package:sumangalam/app/widgets/app_page_view.dart';
import 'package:sumangalam/core/router/app_route.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      mode: PageMode.home,
      child: Center(
        child: SpacedColumn(
          margin: const EdgeInsets.all(12),
          children: [
            AppFeatureWidget(
              icon: Image.asset(
                AppIcons.gateEntry.path,
                fit: BoxFit.contain,
              ),
              title: 'Gate Entry',
              featureColor: AppColors.white,
              onTap: () =>RoutePath.gateEntry.push(context),
            ),
          ],
        ),
      ),
    );
  }
}
