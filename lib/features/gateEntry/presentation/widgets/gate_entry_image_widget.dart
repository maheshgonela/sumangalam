import 'dart:io';

import 'package:flutter/material.dart';

import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/utils/attachment_selection_mixin.dart';
import 'package:sumangalam/core/widgets/caption_text.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';

class ImageSelectionWidget extends StatefulWidget {
  const ImageSelectionWidget({
    required this.onImage,
    this.height = 150,
    this.width = 150,
    super.key,
    this.title,
    this.promptDescription = false,
    this.file,
    this.rebuild = false,
    this.readOnly = false,
    required this.captionTitle,
    this.iconAlignment = Alignment.center,
    this.icon,
    this.fieldColor,
    this.borderColor = AppColors.deepSapphire,
  });

  final Function(File? file) onImage;
  final double height;
  final double width;
  final String? title;
  final bool promptDescription;
  final File? file;
  final bool rebuild;
  final bool readOnly;
  final String captionTitle;
  final Alignment iconAlignment;
  final Widget? icon;
  final Color? fieldColor;
  final Color borderColor;

  @override
  State<ImageSelectionWidget> createState() => _ImageSelectionWidgetState();
}

class _ImageSelectionWidgetState extends State<ImageSelectionWidget>
    with AttahcmentSelectionMixin {
  File? _selectedImage;
  @override
  void initState() {
    super.initState();
    if (widget.file != null && widget.rebuild == false) {
      _selectedImage = widget.file;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.readOnly,
      child: Stack(
        children: [
          GestureDetector(
            onTap: _selectFile,
            child: _selectedImage == null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CaptionText(title: widget.captionTitle),
                      Container(
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: widget.fieldColor,
                          border: Border.all(color: widget.borderColor),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.deepSapphire,
                              blurRadius: 1,
                              offset: Offset(2, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Stack(
                          children: [
                            const Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: null,
                              ),
                            ),
                            Center(
                              child: widget.icon != null
                                  ? Align(
                                      alignment: widget.iconAlignment,
                                      child: widget.icon,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      height: widget.height,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue, strokeAlign: 1, width: 2),
                          borderRadius: BorderRadius.circular(4)),
                      child: Image.file(_selectedImage!, fit: BoxFit.cover),
                    ),
                  ),
          ),
          if (_selectedImage != null)
            Positioned(
              right: 6,
              top: 18,
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedImage = null;
                      widget.onImage(null);
                    });
                  },
                  icon: const Icon(Icons.clear, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _selectFile() async {
    final fileResult = await showModalBottomSheet<File?>(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _IconBtn(
              onTap: () async {
                final capturedImage = await captureImage();
                if (!mounted) return;
                context.exit(capturedImage);
              },
              icon: Icons.camera,
              label: 'Camera',
            ),
            _IconBtn(
              onTap: () async {
                final capturedImage = await selectImageFromGallery();
                if (!mounted) return;
                context.exit(capturedImage);
              },
              icon: Icons.image,
              label: 'Gallery',
            ),
            _IconBtn(
              onTap: () async {
                final capturedImage = await selectImageFromLocal();
                if (!mounted) return;
                context.exit(capturedImage);
              },
              icon: Icons.smartphone,
              label: 'Phone',
            ),
          ],
        ),
      ),
    );
    if (fileResult != null) {
      setState(() {
        _selectedImage = fileResult;

        widget.onImage(_selectedImage);
      });
    }
  }
}

class _IconBtn extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final IconData icon;
  const _IconBtn(
      {required this.onTap, required this.label, required this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SpacedColumn(
        margin: const EdgeInsets.all(12.0),
        defaultHeight: 8.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Colors.black),
          Text(label,
              style: context.textTheme.labelSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
