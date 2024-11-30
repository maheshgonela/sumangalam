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
    this.featureColor = AppColors.cobaltBlue,
  });

  final Widget icon;
  final String title;
  final Color featureColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 130,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: featureColor, width: 2),
          color: featureColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacer.p8(),
            icon,
            AppSpacer.p8(),
            Expanded(
              child: Container(
                width: context.sizeOfWidth,
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: featureColor),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    title,
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleLarge(context).copyWith(fontSize: 18,color: AppColors.black),
                  ),
                ),
              ),
            ),
          ],  
        ),
      ),
    );
  }
}
