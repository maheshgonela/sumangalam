import 'package:flutter/material.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';
import 'package:sumangalam/core/widgets/app_spacer.dart';
import 'package:sumangalam/core/widgets/primary_btn.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';

import 'dart:math' as math;

import '../widgets/app_page_view.dart';

class AppProfilePage extends StatelessWidget {
  const AppProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView(
        mode: PageMode.profile,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              SpacedColumn(
                defaultHeight: 0,
                divider: Divider(color: AppColors.grey.shade400),
                children: const [
                  _ProfileItem(
                      Icon(Icons.account_circle_rounded,
                          color: AppColors.catalineBlue),
                      'Name',
                      'Mahesh'),
                  _ProfileItem(
                      Icon(Icons.corporate_fare, color: AppColors.catalineBlue),
                      'Organization',
                      'NA'),
                  _ProfileItem(
                      Icon(Icons.lock, color: AppColors.catalineBlue),
                      'App Version',
                      '0.0.1'),
                ],
              ),
              AppSpacer.p24(),
              PrimaryBtn(
                title: 'Logout',
                icon: Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child:
                      const Icon(Icons.logout_outlined, color: AppColors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem(this.icon, this.title, this.value);

  final Widget icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 16, backgroundColor: AppColors.white, child: icon),
          AppSpacer.p8(),
          Text(title,
              style: AppTextStyles.titleLarge(context)
                  .copyWith(color: AppColors.black)),
          const Spacer(),
          Text(value,
              style: AppTextStyles.titleLarge(context)
                  .copyWith(color: AppColors.grey)),
        ],
      ),
    );
  }
}
