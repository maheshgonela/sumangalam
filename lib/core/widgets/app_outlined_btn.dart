import 'package:flutter/material.dart';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

class AppOutlinedBtn extends StatelessWidget {
  const AppOutlinedBtn({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.catalineBlue,
    this.icon = const SizedBox.shrink(),
  });

  final String label;
  final Widget icon;
  final VoidCallback? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = context.textTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 18,
    );

    return OutlinedButton.icon(
      icon: icon,
      style: OutlinedButton.styleFrom(
        surfaceTintColor: AppColors.normal,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(4),
        ),
        visualDensity: VisualDensity.compact,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      label: Text(label, style: titleTextStyle),
    );
  }
}
