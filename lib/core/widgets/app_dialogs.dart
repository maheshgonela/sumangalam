import 'package:flutter/material.dart';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/widgets/app_spacer.dart';
import 'package:sumangalam/core/widgets/primary_btn.dart';

enum DialogType { success, normal, error, confirmRetry }

extension DialogTypeExt on DialogType {
  Color get color => switch (this) {
        DialogType.success => AppColors.success,
        DialogType.normal => AppColors.normal,
        DialogType.error => AppColors.error,
        DialogType.confirmRetry => AppColors.warning,
      };
}

class AppDialog {
  static show(
    BuildContext context, {
    String? title,
    required String content,
    required VoidCallback onTapOkay,
    DialogType type = DialogType.normal,
    String buttonText = 'Okay',
    bool barrierDismissible = true,
  }) =>
      showGeneralDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierLabel: "",
        pageBuilder: (context, animation, secondaryAnimation) {
          return _DialogWidget(
            title: title,
            content: content,
            buttonText: buttonText,
            onTapDismiss: onTapOkay,
            dialogType: type,
          );
        },
      );

  static Future showErrorDialog(
    BuildContext context, {
    String? title,
    required String content,
    required VoidCallback onTapDismiss,
    bool barrierDismissible = true,
  }) async =>
      await showGeneralDialog(
        context: context,
        barrierLabel: '',
        useRootNavigator: true,
        barrierDismissible: barrierDismissible,
        pageBuilder: (context, animation, secondaryAnimation) {
          return _DialogWidget(
            title: title,
            content: content,
            buttonText: 'Cancel',
            onTapDismiss: onTapDismiss,
            dialogType: DialogType.error,
          );
        },
      );

  static Future<T?> showSuccessDialog<T>(
    BuildContext context, {
    required String content,
    String buttonText = 'Okay',
    bool barrierDismissible = true,
    Duration duration = const Duration(milliseconds: 600),
  }) async =>
      await showDialog(
        context: context,
        builder: (context) {
          // Future.delayed(duration, () {
          //   Navigator.of(context, rootNavigator: false).pop();
          // });
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            backgroundColor: AppColors.budhaGold,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  static Future<T?> askForConfirmation<T>(
    BuildContext context, {
    String? title,
    required String content,
    required VoidCallback onTapDismiss,
    String buttonText = 'Cancel',
    bool barrierDismissible = true,
    String confirmBtnText = 'Okay',
    required VoidCallback onTapConfirm,
  }) async =>
      await showGeneralDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        pageBuilder: (context, animation, secondaryAnimation) {
          return _DialogWidget(
            title: title,
            content: content,
            buttonText: buttonText,
            onTapDismiss: onTapDismiss,
            dialogType: DialogType.confirmRetry,
            confirmBtnText: confirmBtnText,
            onTapConfirm: onTapConfirm,
          );
        },
      );
  static Future<T?> showPermissionDeniedDialog<T>(
    BuildContext context, {
    String? title,
    required String content,
    String cancelButtonText = 'Cancel',
    String settingsButtonText = 'Settings',
    required VoidCallback onTapCancel,
    required VoidCallback onTapSettings,
    bool barrierDismissible = true,
  }) async =>
      await showGeneralDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        pageBuilder: (context, animation, secondaryAnimation) {
          return _DialogWidget(
            title: title,
            content: content,
            buttonText: cancelButtonText,
            onTapDismiss: onTapCancel,
            dialogType: DialogType.confirmRetry,
            confirmBtnText: settingsButtonText,
            onTapConfirm: onTapSettings,
          );
        },
      );
}

class _DialogWidget extends StatelessWidget {
  const _DialogWidget({
    required this.content,
    required this.buttonText,
    required this.onTapDismiss,
    required this.dialogType,
    this.title,
    this.onTapConfirm,
    this.confirmBtnText,
  });

  final String? title;
  final String content;
  final String buttonText;
  final VoidCallback onTapDismiss;
  final DialogType dialogType;

  final VoidCallback? onTapConfirm;
  final String? confirmBtnText;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 340),
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: dialogType == DialogType.confirmRetry
                ? AppColors.budhaGold
                : dialogType.color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (dialogType == DialogType.normal) ...[
                // AppIcons.info.toWidget(color: dialogType.color)
              ] else ...[
                // AppIcons.confirm.toWidget(
                //   color: dialogType == DialogType.confirmRetry
                //       ? AppColors.white
                //       : dialogType.color,
                // )
              ],
              AppSpacer.p8(),
              if (title.containsValidValue) ...[
                Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 24,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ] else ...[
                AppSpacer.p4(),
              ],
              AppSpacer.p8(),
              Text(
                content,
                style: TextStyle(
                  color: dialogType == DialogType.confirmRetry
                      ? AppColors.white
                      : AppColors.white,
                  height: 1.5,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacer.p32(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PrimaryBtn(
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: dialogType == DialogType.confirmRetry
                            ? AppColors.budhaGold
                            : dialogType.color,
                      ),
                      title: buttonText,
                      onPressed: onTapDismiss,
                      color: dialogType == DialogType.confirmRetry
                          ? AppColors.white
                          : dialogType.color,
                    ),
                  ),
                  if (dialogType == DialogType.confirmRetry) ...[
                    AppSpacer.p24(),
                    Expanded(
                      child: PrimaryBtn(
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: dialogType == DialogType.confirmRetry
                              ? AppColors.white
                              : dialogType.color,
                        ),
                        title: confirmBtnText!,
                        onPressed: onTapConfirm,
                        color: dialogType == DialogType.confirmRetry
                            ? AppColors.budhaGold
                            : dialogType.color,
                        border: const BorderSide(
                          width: 2,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
