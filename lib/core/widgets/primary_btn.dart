import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';
import 'package:sumangalam/core/widgets/widgets.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.margin,
    required this.label,
    this.bgColor = AppColors.normal,
    this.isLoading = false,
    this.onPressed,
    this.textStyle,
    this.icon = const SizedBox(),
  });

  final String label;
  final bool isLoading;
  final Color bgColor;
  final Widget icon;
  final EdgeInsets? margin;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ElevatedButton.icon(
        icon: icon,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          fixedSize: Size.fromWidth(context.sizeOfWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: bgColor),
          ),
          padding: const EdgeInsets.all(10.0),
        ),
        onPressed: isLoading ? null : onPressed,
        label: isLoading
            ? const AppLoadingIndicator()
            : Text(label, style: AppTextStyles.btnLabelStyle(context)),
      ),
    );
  }
}
