import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/widgets.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/hr/presentation/bloc/new_on_duty/new_on_duty_cubit.dart';
import 'package:sumangalam/features/hr/presentation/ui/on_duty/widgets/on_duty_form_widget.dart';

class CreateOnDutyScrn extends StatelessWidget {
  const CreateOnDutyScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'On Duth Authentication',
        textColor: AppColors.cobaltBlue,
        status: 'Not Saved',
      ),
      body: BlocListener<NewOnDutyCubit, NewOnDutyState>(
        listener: (_, state) {
          if(state.isSuccess) {
            AppDialog.showSuccessDialog(
              context, 
              content: 'On Duty Auth Created Successfully...!', 
              onTapDismiss: context.exit,
            ).then((value) => context.pop());
            return;
          } 
          if(state.failure != null) {
            AppDialog.showErrorDialog(
              context, 
              title: state.failure!.title,
              content: state.failure!.error, 
              onTapDismiss: context.exit,
            ).then((_) {
              if(!context.mounted) return;
              context.cubit<NewOnDutyCubit>().errorHandled();
            });
          }
          return;
        },
        child: const SingleChildScrollView(child: OnDutyFormWidget()),
      ),
    );
  }
}
