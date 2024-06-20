import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle titleLarge(BuildContext context) => context.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle titleMedium(BuildContext context) => context.textTheme.titleSmall!.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle errorStyle(BuildContext context) => context.textTheme.labelMedium!.copyWith(
    fontWeight: FontWeight.bold,
    color: AppColors.error,
  );

  static TextStyle btnLabelStyle(BuildContext context) => context.textTheme.titleLarge!.copyWith(
      color: AppColors.white, 
      fontWeight: FontWeight.bold,
    );
}