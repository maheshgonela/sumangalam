import 'package:flutter/material.dart';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

class CaptionText extends StatelessWidget {
  final Color? textColor;

  const CaptionText(
      {super.key,
      required this.title,
      this.isRequired = true,
      this.textColor = AppColors.black});

  final String title;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    if (title.doesNotHaveValue) return const SizedBox.shrink();

    return RichText(
      text: TextSpan(
        style: context.textTheme.titleSmall?.copyWith(
            color: textColor,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: .5),
        children: [
          TextSpan(text: title),
          if (isRequired) ...[
            const TextSpan(
                text: ' *', style: TextStyle(color: AppColors.error)),
          ],
        ],
      ),
    );
  }
}
