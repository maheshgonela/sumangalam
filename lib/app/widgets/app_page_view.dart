import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sumangalam/core/core.dart';
import 'package:sumangalam/core/styles/app_colors.dart';
import 'package:sumangalam/core/styles/app_icon.dart';
import 'package:sumangalam/core/styles/app_text_styles.dart';
import 'package:sumangalam/core/widgets/spaced_column.dart';

enum PageMode {home, profile}

class AppPageView extends StatelessWidget {
  const AppPageView({super.key, required this.child, required this.mode});

  final Widget child;
  final PageMode mode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 52,
            top: -12,
            child: Image.asset(AppIcons.grateEntryBG.path, alignment: Alignment.topRight, fit: BoxFit.cover,height: 210,width: context.sizeOfWidth),
          ),
          Positioned(
            left: 18,
            right: 8,
            top: kToolbarHeight,
            child: Text(mode.name.toUpperCase(),style: AppTextStyles.titleLarge(context).copyWith(color: AppColors.black) , 
            ),
          ),
          
          Positioned.fill(
            top: kToolbarHeight + 112,
            child: Container(
              width: context.sizeOfWidth,
              padding: const EdgeInsets.all(8.0).copyWith(top: 100),
              decoration: BoxDecoration(
                color: AppColors.white,
                
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                border: Border.all(color: AppColors.white),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, -1),
                  )
                ],
              ),
              child: child,
            ),
          ),
          
          Positioned(
            left: 24,
            right: 24,
            top: 100,
            child: Card(
              color: AppColors.powderBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: AppColors.kashmirBlue)
              ),
              child: mode == PageMode.home ? const _HomeCardContent() : const _SettingsCardContent(),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeCardContent extends StatelessWidget {
  const _HomeCardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: SpacedColumn(
            margin: const EdgeInsets.all(8.0),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.dayOfTimeGreeting(), style: AppTextStyles.titleLarge(context).copyWith(color: AppColors.powderBlue)),
              Text('Ready to capture some entries?', style: AppTextStyles.titleMedium(context).copyWith(color: AppColors.black)),
            ],
          ),
        ),
        SvgPicture.asset(AppIcons.welcome.path, alignment: Alignment.topRight),
      ],
    );
  }
}

class _SettingsCardContent extends StatelessWidget {
  const _SettingsCardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: SpacedColumn(
            margin: const EdgeInsets.all(8.0),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome,', style: AppTextStyles.titleLarge(context).copyWith(color: AppColors.black)),
              Text('Your security and convenience, prioritized."',maxLines: 2, style: AppTextStyles.titleMedium(context).copyWith(color: AppColors.black,)),
            ],
          ),
        ),
        SvgPicture.asset(AppIcons.settings.path, alignment: Alignment.topRight),
      ],
    );
  }
}
