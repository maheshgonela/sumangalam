import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';
import 'package:sumangalam/core/widgets/doc_status_widget.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({
    super.key,
    required this.title,
    required this.textColor,
    required this.status, 
  });

  final String title;
  final Color textColor;
  final String status;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      scrolledUnderElevation: 0.0,
      titleSpacing: 0,
      centerTitle: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: AppTextStyles.titleLarge(context).copyWith(color: AppColors.black)),
        ],
      ),
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: context.pop,
        icon: const CircleAvatar(
          radius: 14,
          backgroundColor: AppColors.black,
          child: Icon(Icons.arrow_back, color: AppColors.white, size: 18),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: DocStatusWidget(status: status),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
