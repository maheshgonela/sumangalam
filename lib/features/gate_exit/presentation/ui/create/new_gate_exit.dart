import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit/new_gate_exit_cubit.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/bloc_providers.dart';
import 'package:sumangalam/features/gate_exit/presentation/bloc/gate_exit_filter/gate_exit_filters.dart';
import 'package:sumangalam/features/gate_exit/presentation/ui/create/widgets/gate_exit_form_widget.dart';

class NewGateExitScrn extends StatefulWidget {
  const NewGateExitScrn({super.key});

  @override
  State<NewGateExitScrn> createState() => _NewGateExitScreenState();
}

class _NewGateExitScreenState extends State<NewGateExitScrn> {
  @override
  Widget build(BuildContext context) {
    final form = context.read<NewGateExitCubit>().state.form;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: SimpleAppBar(
        title: form.exitno ?? 'New Gate Exit',
        textColor: AppColors.cobaltBlue,
        status: form.status ?? 'Not Saved',
      ),
      body: BlocListener<NewGateExitCubit, NewGateExitState>(
        listener: (context, state) async {
          if (state.isSuccess && state.successMsg.isNotNull) {
            await AppDialog.showSuccessDialog(
              context,
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            );
            if (!context.mounted) return;
            final filters = context.read<GateExitFilterCubit>().state;
            context
              ..cubit<NewGateExitCubit>().handled()
              ..cubit<GateExitsCubit>().fetchInitial(filters);
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
            context.cubit<NewGateExitCubit>().handled();
            return;
          }
        },
        child: const GateExitFormWidget(),
      ),
    );
  }
}
