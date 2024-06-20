import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/caption_text.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';

class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    super.key,
    this.hint,
    required this.items,
    required this.onSelected,
    this.defaultSelection,
    this.isMandatory = false,
    this.readOnly = false,
    this.listItemBuilder,
    this.headerBuilder,
    this.hintBuilder,
    this.closedFillColor,
    required this.title,
  });
  final String? hint;
  final List<T> items;
  final Widget Function(BuildContext, T, bool header)? headerBuilder;
  final Widget Function(BuildContext, T, bool, void Function())?
      listItemBuilder;
  final T? defaultSelection;
  final bool isMandatory;
  final bool readOnly;
  final String title;
  final void Function(T?) onSelected;
  final Widget Function(BuildContext context, String hint, bool name)?
      hintBuilder;
  final Color? closedFillColor;
  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.defaultSelection;
  }

  @override
  Widget build(BuildContext context) {
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
            color:  AppColors.white,
            border: Border.all(color: AppColors.white),
            boxShadow: const [
              BoxShadow(
                color:  AppColors.catalineBlue,
                blurRadius: 1,
                offset: Offset(2, 5)
              ),
            ],
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: AbsorbPointer(
            absorbing: widget.readOnly,
            child: CustomDropdown<T>(
              hideSelectedFieldWhenExpanded: true,
              excludeSelected: false,
              closedHeaderPadding: const EdgeInsets.all(12.0),
              expandedHeaderPadding: const EdgeInsets.all(12.0),
              decoration: CustomDropdownDecoration(
                closedBorderRadius: BorderRadius.circular(8.0),
                expandedBorderRadius: BorderRadius.circular(8.0),
                closedBorder: Border.all(width: 0.4),
                closedFillColor: widget.closedFillColor?.withOpacity(0.5),
                expandedBorder: Border.all(width: 0.4),
                hintStyle: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              hintText: widget.hint,
              items: widget.items,
              hintBuilder: widget.hintBuilder,
              headerBuilder: widget.headerBuilder,
              listItemBuilder: widget.listItemBuilder,
              onChanged: widget.onSelected,
              initialItem: _selectedValue,
            ),
          ),
        ),
      ],
    );
  }
}
