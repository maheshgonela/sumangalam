import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/gate_exit/model/gate_exit_form.dart';

class GateExitWidget extends StatelessWidget {
  const GateExitWidget({
    super.key,
    required this.gateExit,
    required this.onTap,
  });

  final GateExitForm gateExit;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: AppColors.catalineBlue, width: 1)
        ),
        child: Stack(
          children: [
            Positioned.fill(
              left: context.sizeOfWidth * 0.3,
              child: Image(
                image: AssetImage(AppIcons.gateEntryFrame.path),
                fit: BoxFit.fill,
              ),
            ),
            SpacedColumn(
              defaultHeight: 4,
              margin: const EdgeInsets.all(12),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(gateExit.exitno.valueOrEmpty, 
                  style: AppTextStyles.titleLarge(context).copyWith(color: AppColors.black)),
                Text(gateExit.poNumber.valueOrEmpty,
                  style: AppTextStyles.titleLarge(context).copyWith(color: AppColors.black)),
                AppSpacer.p8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ViewBtn(onPressed: onTap),
                    DocStatusWidget(status: gateExit.status.valueOrEmpty)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
