import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/widgets/widgets.dart';

class SectoinHead extends StatelessWidget {
  const SectoinHead({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacer.p4(),
        Text(title, style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),),
        AppSpacer.p8(),
      ],
    );
  }
}