import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/utils/date_format_util.dart';
import 'package:sumangalam/core/widgets/caption_text.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';

class DateSelectionField extends StatefulWidget {
  const DateSelectionField({
    super.key,
    required this.title,
    this.initialValue,
    this.readOnly = false,
    this.hintText,
    this.suffixIcon,
    required this.firstDate,
    required this.lastDate, 
    required this.onDateSelect, 
    this.borderColor,
  });

  final String title;
  final DateTime firstDate;
  final DateTime lastDate;
  final String? initialValue;
  final bool readOnly;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Function(DateTime date) onDateSelect;

  @override
  State<DateSelectionField> createState() => _DateSelectionFieldState();
}

class _DateSelectionFieldState extends State<DateSelectionField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    final textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: AppColors.black, width: 0.8),
    );

    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4.0,
      children: [
        CaptionText(
          title: widget.title,
        ),
        Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.white),
            boxShadow: [
              BoxShadow(
                color: widget.borderColor ?? AppColors.white,
                blurRadius: 1,
                offset: const Offset(2, 5)
              ),
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: TextField(
            onTap: () {
              if (widget.readOnly) return;
              showDatePickerDialog();
            },
            controller: controller,
            decoration: InputDecoration(
              border: textFieldBorder,
              enabledBorder: textFieldBorder,
              disabledBorder: textFieldBorder,
              focusedBorder: textFieldBorder,
              contentPadding: const EdgeInsets.all(16.0),
              suffixIcon: widget.suffixIcon,
              counterText: '',
            ),
            textInputAction: TextInputAction.done,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            textCapitalization: TextCapitalization.none,
            readOnly: true,
            autocorrect: false,
          ),
        ),
      ],
    );
  }

  void showDatePickerDialog() async {
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
    );
    if(selectedDate.isNotNull) {
      final formattedDate = DFU.friendlyFormat(selectedDate!);
      setState(() {
        controller.text = formattedDate;
      });
      widget.onDateSelect(selectedDate);
    }
  }
}
