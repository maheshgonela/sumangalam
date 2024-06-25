import 'package:flutter/material.dart';

// raw image
// with default size
// with custom size
class AppIcons {
  static const _basePath = 'assets';
  static const _imagesPath = '$_basePath/images';
  
  static AppIcon get login => const AppIcon('$_imagesPath/login.svg');
  static AppIcon get graphicCard => const AppIcon('$_imagesPath/graphic_card.svg');
  static AppIcon get welcome => const AppIcon('$_imagesPath/welcome.svg');
  static AppIcon get settings => const AppIcon('$_imagesPath/settings.svg');
  static AppIcon get appLogo => const AppIcon('$_imagesPath/app_logo.png');
  static AppIcon get gateEntry => const AppIcon('$_imagesPath/gate_entry.png');
  static AppIcon get bgFrame => const AppIcon('$_imagesPath/bg_frame.png');
}

class AppIcon {
  final String path;

  const AppIcon(this.path);

  Widget toImage([double? width, double? height]) =>
      Image.asset(path, width: width, height: height);

  Widget toWidget({
    double? width,
    double? height,
    Color? color,
  }) =>
      Image.asset(path, width: width, height: height, color: color);
}
