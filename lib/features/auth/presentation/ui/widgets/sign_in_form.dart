import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sumangalam/core/ext/context_ext.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/widgets/app_text_field.dart';
import 'package:sumangalam/core/widgets/primary_btn.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';
import 'package:sumangalam/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key});

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  late final TextEditingController _username;
  late final TextEditingController _pswd;
  bool _showPswd = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _pswd = TextEditingController();
  }

  void togglePswd() => setState(() {
        _showPswd = !_showPswd;
      });

  void toggleRememberMe(bool? value) => setState(() {
        _rememberMe = value ?? false;
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        defaultHeight: 8,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: SizedBox(
              height: context.sizeOfHeight * 0.2,
              width: context.sizeOfWidth,
              child: SvgPicture.asset(AppIcons.login.path, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 2),
          const Center(
            child: Column(
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'Please login to continue',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          AppTextField(
            titleColor: AppColors.blue,
            borderColor: AppColors.black,
            title: 'Email',
            controller: _username,
            prefixIcon: const Icon(Icons.person),
          ),
          AppTextField(
            titleColor: AppColors.blue,
            borderColor: AppColors.black,
            title: 'Enter Password',
            controller: _pswd,
            obscureText: _showPswd,
            suffixIcon: InkWell(
                onTap: togglePswd,
                child: _showPswd
                    ? const Icon(
                        Icons.visibility_outlined,
                        color: AppColors.catalineBlue,
                      )
                    : const Icon(
                        Icons.visibility_off_outlined,
                      )),
          ),
          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: toggleRememberMe,
                activeColor: AppColors.blue,
              ),
              const Text(
                'Remember Me',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (_, state) {
              final isloading =
                  state.maybeWhen(loading: () => true, orElse: () => false);
                  final color = _rememberMe ? AppColors.blue:AppColors.grey;
              return PrimaryBtn(
                color: color,
                isloading: isloading,
                onPressed: () {
                  context.cubit<SignInCubit>().login(
                        _username.text,
                        _pswd.text,
                      );
                },
                title: 'SIGN IN',
              );
            },
          ),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'By continuing you agree to ',
              style: TextStyle(
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\nOur Terms & Privacy',
                  style: TextStyle(
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
          ),
          RichText(
              text: const TextSpan(children: [
            TextSpan(
              text: '\nPowered by ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'EasyCloud',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.blue,
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
