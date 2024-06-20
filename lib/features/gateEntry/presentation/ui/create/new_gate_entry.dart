import 'package:flutter/material.dart';
import 'package:sumangalam/app/widgets/simple_app_bar.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

import 'package:sumangalam/features/gateEntry/presentation/widgets/gate_entry_form_widget.dart';

class NewGateEntry extends StatelessWidget {
  const NewGateEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: AppColors.white,
      appBar: SimpleAppBar(title: 'New Gate Entry'),
      body: GateEntryFormWidget(),
    );
  }
}
