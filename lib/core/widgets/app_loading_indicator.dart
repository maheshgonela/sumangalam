import 'package:flutter/material.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(color: AppColors.budhaGold),
      ),
    );
  }
}
