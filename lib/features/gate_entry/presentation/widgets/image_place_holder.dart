import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/caption_text.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    super.key,
    this.fieldColor = AppColors.white,
    this.borderColor = AppColors.white,
    this.icon,
    required this.title,
    this.iconAlignment = Alignment.center,
  });

  final Color fieldColor;
  final Color borderColor;
  final Widget? icon;
  final String title;
  final Alignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CaptionText(title: title),
        Container(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: fieldColor,
            border: Border.all(color: borderColor),
            boxShadow: const [
              BoxShadow(
                color: AppColors.white,
                blurRadius: 1,
                offset: Offset(2, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Stack(
            children: [
              if (icon.isNotNull) ...[
                Align(alignment: iconAlignment, child: icon!)
              ],
            ],
          ),
        ),
      ],
    );
  }
}
