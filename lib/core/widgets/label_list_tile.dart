import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/app_spacer.dart';

class LabelListTile extends StatelessWidget {
  const LabelListTile({
    super.key,
    required this.leading,
    required this.title,
    required this.value,
    this.valueColor = AppColors.black,
  });

  final Widget leading;
  final String title;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle([Color? color]) => context.textTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: color,
    );
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      surfaceTintColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            leading,
            AppSpacer.p4(),
            Text(title, style: textStyle(AppColors.deepSapphire)),
            AppSpacer.p4(),
            Text(':', style: textStyle(AppColors.deepSapphire)),
            AppSpacer.p8(),
            Flexible(child: Text(value, style: textStyle(valueColor),overflow: TextOverflow.ellipsis,)),
          ],
        ),
      ),
    );
  }
}
