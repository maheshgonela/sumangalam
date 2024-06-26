import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';

class StatusMenuWidget extends StatefulWidget {
  const StatusMenuWidget({super.key, required this.onChange});

  final void Function(String status) onChange;
  @override
  State<StatusMenuWidget> createState() => _StatusMenuWidgetState();
}

class _StatusMenuWidgetState extends State<StatusMenuWidget> {
  String? _selectedDuration = 'Draft';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isDense: true,
      isExpanded: false,
      value: _selectedDuration,
      dropdownColor: AppColors.white,
      hint: Text(
        'Select Status',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      decoration: const InputDecoration(
        fillColor: Colors.white,
    filled: true,
        border: InputBorder.none),

      items: ['Draft', 'Update', 'Submit'].map((e) {
        return DropdownMenuItem<String>(
          value: e,
          alignment: Alignment.center,
          child: Text(
            e,
            style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)
          ),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          _selectedDuration = value;
        });
        widget.onChange.call(value!);
      },
    );
  }
}
