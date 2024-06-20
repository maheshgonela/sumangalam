import 'package:flutter/material.dart';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    super.key,
    required this.onPressed,
    required this.title,
    this.padding = EdgeInsets.zero,
    this.color,
    this.style,
    this.width,
    this.height = 55,
    this.isloading = false,
    this.icon = const SizedBox(),
    this.border,
    this.enabled = true,
  });

  final void Function()? onPressed;
  final String title;
  final bool isloading;
  final EdgeInsets? padding;
  final TextStyle? style;
  final double? width;
  final double? height;
  final Widget? icon;
  final Color? color;
  final BorderSide? border;
  final bool? enabled;

  factory PrimaryBtn.icon({
    required void Function() onPressed,
    required String title,
    required Widget icon,
    final Color? color,
    double? height,
  }) =>
      PrimaryBtn(
        onPressed: onPressed,
        title: title,
        icon: icon,
        color: color,
        height: height,
      );

  @override
  Widget build(BuildContext context) {
    final bgColor = color ?? context.colorScheme.primary;
    final btnWidth = width ?? MediaQuery.of(context).size.width;
    final textStyle = style ??
        context.textTheme.titleLarge
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
    return Padding(
      padding: padding!,
      child: ElevatedButton.icon(
        onPressed: (enabled! && !isloading) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey.shade400,
          elevation: 0,
          backgroundColor: bgColor,
          fixedSize: Size(btnWidth, height ?? 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: border,
        ),
        icon: icon!,

        /// builds CircularProgressIndicator when isloading is TRUE.
        label: isloading
            ? const Padding(
                padding: EdgeInsets.all(2.0),
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                  color: AppColors.deepSapphire,
                ),
              )
            : Text(title, style: textStyle),
      ),
    );
  }
}
