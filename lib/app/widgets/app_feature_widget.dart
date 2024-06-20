import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';
import 'package:sumangalam/core/widgets/app_spacer.dart';


class AppFeatureWidget extends StatelessWidget {
  const AppFeatureWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap, 
    this.featureColor,
  });

  final Widget icon;
  final String title;
  final Color? featureColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: featureColor ?? AppColors.catalineBlue, width: 2),
            color:AppColors.cobaltBlue,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSpacer.p24(),
              icon,
              Container(
                width: context.sizeOfWidth,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cobaltBlue),
                  color: featureColor ?? AppColors.cobaltBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: AppTextStyles.titleLarge(context).copyWith(fontSize: 24,color: AppColors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
