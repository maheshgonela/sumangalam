import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/widgets/widgets.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
    required this.message,
    this.retry,
  });

  final String message;
  final VoidCallback? retry;
  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      margin: const EdgeInsets.all(14.0),
      defaultHeight: 12,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppIcons.emptyListState.path),
        Text(message, textAlign: TextAlign.center),
        if(retry.isNotNull)...[
          AppButton(
            label: 'REFRESH',
            onPressed: retry,
          )
        ],
      ],
    );
  }
}
