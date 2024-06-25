import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/widgets/app_dialogs.dart';
import 'package:sumangalam/core/widgets/simple_app_bar.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/features/gate_entry/presentation/bloc/gate_entry/new_gate_entry_cubit.dart';
import 'package:sumangalam/features/gate_entry/presentation/ui/create/widgets/gate_entry_form_widget.dart';

class NewGateEntry extends StatefulWidget {
  const NewGateEntry({super.key});

  @override
  State<NewGateEntry> createState() => _NewGateEntryState();
}

class _NewGateEntryState extends State<NewGateEntry> {
  @override
  Widget build(BuildContext context) {
    final gateEntryState = context.read<NewGateEntryCubit>().state;
    final form = gateEntryState.form;
    final status = form.status;
    final gateEntryNo = form.gateEntryNo;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: SimpleAppBar(
        title: gateEntryNo ?? 'New Gate Entry',
        textColor: AppColors.cobaltBlue,
        status: status ?? 'Not Saved',
      ),
      body: BlocListener<NewGateEntryCubit, NewGateEntryState>(
        listener: _gateEntryListener,
        child: const GateEntryFormWidget(),
      ),
    );
  }

  void _gateEntryListener(BuildContext context, NewGateEntryState state) async {
    if (state.isSuccess && state.successMsg.isNotNull) {
      AppDialog.showSuccessDialog(
        context,
        content: state.successMsg.valueOrEmpty,
        onTapDismiss: context.exit,
      );
      context.cubit<NewGateEntryCubit>().handled();
      setState(() {});
      return;
    }
    if (state.error.isNotNull) {
      await AppDialog.showErrorDialog(
        context,
        title: state.error!.title,
        content: state.error!.error,
        onTapDismiss: context.exit,
      );
      if (!context.mounted) return;
      context.cubit<NewGateEntryCubit>().handled();
      return;
    }
  }
}
