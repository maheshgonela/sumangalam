import 'package:flutter/material.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/widgets/caption_text.dart';

class ImagePlaceHolder extends StatelessWidget {
  final Color? fieldColor;
  final Color? borderColor;
  final Widget? icon;
  final String title;
  final Alignment iconAlignment;

  const ImagePlaceHolder({
    Key? key,
    this.fieldColor,
    this.borderColor,
    this.icon,
    required this.title,
    this.iconAlignment = Alignment.center, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CaptionText(title: title),
        Container(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: fieldColor ?? AppColors.white,
            border: Border.all(color: borderColor ?? AppColors.white),
            boxShadow: const [
              BoxShadow(
                color: AppColors.white,
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
                child: icon != null
                    ? Align(
                      alignment: iconAlignment
                      ,child:icon)
                    : null,
               
              ),
            ],
          ),
        ),
      ],
    );
  }
}
