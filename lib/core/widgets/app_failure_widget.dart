import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/primary_btn.dart';


class AppFailureWidget extends StatelessWidget {
  const AppFailureWidget({super.key, required this.errorMsg, this.retry});

  final String errorMsg;
  final VoidCallback? retry;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_outlined,
              color: AppColors.error,
              size: 64,
            ),
            const SizedBox(height: 8.0),
            Text(
              errorMsg,
              
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.error,
              ),
            ),
            const SizedBox(height: 8.0),
            PrimaryBtn(
              onPressed: retry,
              padding: const EdgeInsets.all(12.0),
              title: 'REFRESH',
              color: AppColors.error,
            )
          ],
        ),
      ),
    );
  }
}
