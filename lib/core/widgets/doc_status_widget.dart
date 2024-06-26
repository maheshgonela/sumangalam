import 'package:flutter/material.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';

class DocStatusWidget extends StatelessWidget {
  const DocStatusWidget({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: toColor(),
        border: Border.all(color: toColor()),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Text(status, style: AppTextStyles.titleMedium(context).copyWith(
        color: toTextColor(),
      )),
    );
  }

  Color toColor() => switch(status.trim()) {
    'Submitted' => const Color(0xFFEDF6FD),
    'Not Saved' => const Color(0XFFFFE6AA),
    'Draft' || 'Cancelled' => const Color(0xFFFFF0F0),
    String() => AppColors.black,
  };

  Color toTextColor() => switch(status.trim()) {
    'Submitted' => const Color(0xFF1172C9),
    'Not Saved' => const Color(0XFFB49142),
    'Draft' || 'Cancelled' => const Color(0xFFFE6061),
    String() => AppColors.white,
  };
}