import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:sumangalam/core/styles/app_colors.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({super.key, required this.title});
final String title ;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: context.canPop()
          ? IconButton(
              onPressed: context.pop,
              icon: const CircleAvatar(
                backgroundColor: AppColors.deepSapphire,
                radius: 14,
                child: Icon(Icons.arrow_back, color: AppColors.white, size: 18),
              ),
            )
          : null,
      title: Text(title),
      backgroundColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
