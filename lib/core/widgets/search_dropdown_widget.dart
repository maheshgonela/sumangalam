import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/widgets.dart';

class SearchDropDownList<T> extends StatefulWidget {
  const SearchDropDownList({
    super.key,
    this.title,
    this.hint,
    required this.items,
    required this.onSelected,
    this.defaultSelection,
    this.isMandatory = false,
    this.readOnly = false,
    this.listItemBuilder,
    this.headerBuilder,
    this.futureRequest,
    this.hintBuilder,
    this.closedFillColor,
  });

  final String? title;
  final String? hint;
  final List<T> items;
  final HintBuilder? hintBuilder;
  final HeaderBuilder<T>? headerBuilder;
  final Future<List<T>> Function(String)? futureRequest;
  final ListItemBuilder<T>? listItemBuilder;
  final T? defaultSelection;
  final bool isMandatory;
  final bool readOnly;
  final Color? closedFillColor;
  final void Function(T? item) onSelected;

  @override
  State<SearchDropDownList<T>> createState() => _SearchDropDownListState<T>();
}

class _SearchDropDownListState<T> extends State<SearchDropDownList<T>> {
  T? _selectedValue;

  @override
  Widget build(BuildContext context) {
    _selectedValue = widget.defaultSelection;

    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4.0,
      children: [
        CaptionText(title: widget.title.valueOrEmpty, isRequired: widget.isMandatory),
        Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color:  AppColors.white,
            border: Border.all(color: AppColors.white, width: 0),
            boxShadow: const [
              BoxShadow(
                color: AppColors.catalineBlue,
                blurRadius: 0.8,
                offset: Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: AbsorbPointer(
            absorbing: widget.readOnly,
            child: CustomDropdown<T>.searchRequest(
              hideSelectedFieldWhenExpanded: true,
              excludeSelected: false,
              futureRequestDelay: const Duration(milliseconds: 500),
              closedHeaderPadding: const EdgeInsets.all(16.0),
              expandedHeaderPadding: const EdgeInsets.all(16.0),
              searchRequestLoadingIndicator: const AppLoadingIndicator(),
              decoration: CustomDropdownDecoration(
                closedSuffixIcon: const Icon(Icons.arrow_drop_down),
                closedBorder: Border.all(width: 0.4),
                expandedBorder: Border.all(width: 0.4),
                closedBorderRadius: BorderRadius.circular(8.0),
                expandedBorderRadius: BorderRadius.circular(8.0),
                closedFillColor: widget.closedFillColor?.withOpacity(0.5),
                hintStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.black, 
                  fontWeight: FontWeight.w500,
                ),
              ),
              hintBuilder: widget.hintBuilder,
              futureRequest: widget.futureRequest,
              hintText: widget.hint,
              items: widget.items,
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
