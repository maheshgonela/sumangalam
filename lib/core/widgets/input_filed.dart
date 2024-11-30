import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/caption_text.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.title,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.inputType = TextInputType.text,
    this.maxLength = 255,
    this.readOnly = false,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.autofocus = false,
    this.borderColor = AppColors.catalineBlue,
    this.minLines,
    this.inputFormatters,
    TextEditingController? controller,
    this.fieldColor,
    this.labelText,
    this.maxLines,
  }) {
    this.controller = controller ?? TextEditingController();
    if (initialValue?.isNotEmpty == true) {
      this.controller?.text = initialValue!;
    }
  }

  final String title;
  final String? initialValue;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputType inputType;
  final int maxLength;
  final bool readOnly;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final Color? fieldColor;
  final String? labelText;
  late final TextEditingController? controller;
  final bool autofocus;
  final int? minLines;
  final int? maxLines;

  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppColors.black, width: 0.8),
    );

    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4.0,
      children: [
        CaptionText(title: title),
        Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color:  AppColors.white,
            border: Border.all(color: AppColors.white, width: 0),
            boxShadow: [
              BoxShadow(
                color: borderColor ?? AppColors.white,
                blurRadius: 0.8,
                offset: const Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              border: textFieldBorder,
              enabledBorder: textFieldBorder,
              hintText: hintText,
              focusedBorder: textFieldBorder,
              contentPadding: const EdgeInsets.all(16.0),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              filled: readOnly,
              fillColor: AppColors.himlayaPeeks.withOpacity(0.8),
              counterText: '',
            ),
            obscuringCharacter: '*',
            cursorColor: AppColors.black,
            textInputAction: TextInputAction.done,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            textCapitalization: TextCapitalization.none,
            readOnly: readOnly,
            minLines: minLines,
            maxLines: maxLines,
            autocorrect: false,
            autofocus: autofocus,
          ),
        ),
      ],
    );
  }
}
