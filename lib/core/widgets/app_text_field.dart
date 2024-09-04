import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/caption_text.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required this.title,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.inputType = TextInputType.text,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength = 255,
    this.readOnly = false,
    this.helperText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.obscureText = false,
    this.inputBg,
    this.borderColor = AppColors.catalineBlue,
    this.borderWidth = 1,
    this.titleColor,
    TextEditingController? controller, this.showSearchBar,
  }) {
    this.controller = controller ?? TextEditingController();
    if (initialValue?.isNotEmpty == true) {
      this.controller?.text = initialValue!;
    }
  }

  final String title;
  final Color? titleColor;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;
  final TextInputType inputType;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final bool readOnly;
  final String? helperText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  late final TextEditingController? controller;
  final bool autofocus;
  final bool obscureText;
  final Color? inputBg;
  final Color borderColor;
  final double borderWidth;
  final bool? showSearchBar; 

  @override
  Widget build(BuildContext context) {
    final textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    );

    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4.0,
      children: [
        CaptionText(
          textColor: titleColor,
          title: title,
        ),
        TextField(
          onTap: onTap,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.textTheme.titleMedium
                ?.copyWith(color: AppColors.grey,fontWeight: FontWeight.bold),
            border: textFieldBorder,
            enabledBorder: textFieldBorder,
            focusedBorder: textFieldBorder,
            contentPadding: const EdgeInsets.all(12.0),
            suffixIcon: suffixIcon,
            counterText: '',
            filled: inputBg.isNull ? false : true,
            fillColor: inputBg,
          ),
          obscuringCharacter: '*',
          textInputAction: TextInputAction.done,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          keyboardType: inputType,
          minLines: minLines,
          maxLines: maxLines,
          cursorColor: AppColors.black,
          maxLength: maxLength,
          textCapitalization: TextCapitalization.none,
          readOnly: readOnly,
          autocorrect: false,
          autofocus: autofocus,
        ),
      ],
    );
  }
}
