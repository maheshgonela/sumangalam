import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:sumangalam/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:sumangalam/features/auth/presentation/ui/widgets/sign_in_form.dart';

import '../../../../core/widgets/app_dialogs.dart';


class AuthenticationScrn extends StatelessWidget {
  const AuthenticationScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInCubit, SignInState>(
        listener: (_, state) {
          state.maybeWhen(
            orElse: () {},
            success: context.cubit<AuthCubit>().authCheckRequested,
            failure: (failure) => AppDialog.showErrorDialog(
              context,
              title: 'Oops',
              content: failure.error,
              onTapDismiss: context.exit,
            ),
          );
        },
        child: const SignInFormWidget(),
      ),
    );
  }
}
