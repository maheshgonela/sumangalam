import 'package:flutter/material.dart';

class SimpleSearchBar extends StatefulWidget {
  const SimpleSearchBar({
    required this.hintText,
    required this.onSearch,
    required this.onCancel,
    super.key,
  });

  final String hintText;
  final Function(String) onSearch;
  final Function() onCancel;

  @override
  State<SimpleSearchBar> createState() => _SimpleSearchBarState();
}

class _SimpleSearchBarState extends State<SimpleSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: (value) {
        if (value.length < 3) return;
        widget.onSearch(value);
      },
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 40, minHeight: 40),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.0),
        ),
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4.0),
        ),
        suffixIcon: IconButton(
          key: const Key('clear-search'),
          onPressed: _clearField,
          icon: const Icon(Icons.clear),
        ),
      ),
      textInputAction: TextInputAction.search,
      maxLines: 1,
    );
  }

  void _clearField() {
    widget.onCancel();
    _controller.clear();
    _focusNode.unfocus();
    setState(() {
      
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _controller.dispose();
  }
}