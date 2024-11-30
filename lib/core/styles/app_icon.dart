import 'package:flutter/material.dart';

// raw image
// with default size
// with custom size
class AppIcons {
  static const _basePath = 'assets';
  static const _imagesPath = '$_basePath/images';
  
  static AppIcon get login => const AppIcon('$_imagesPath/login.svg');
  static AppIcon get grateEntryBG => const AppIcon('$_imagesPath/gate_entry_graphic.png');
  static AppIcon get welcome => const AppIcon('$_imagesPath/welcome.svg');
  static AppIcon get settings => const AppIcon('$_imagesPath/settings.svg');
  static AppIcon get appLogo => const AppIcon('$_imagesPath/app_logo.png');
  static AppIcon get gateEntryFrame => const AppIcon('$_imagesPath/gate_entry_frame.png');
  static AppIcon get vehicleIn => const AppIcon('$_imagesPath/gate_entry.png');
  static AppIcon get vehicleOut => const AppIcon('$_imagesPath/gate_exit.png');
  static AppIcon get emptyListState => const AppIcon('$_imagesPath/list_empty_state.svg');
  static AppIcon get empSearch => const AppIcon('$_imagesPath/employee_search.png');
  static AppIcon get jobSearch => const AppIcon('$_imagesPath/jobs_person.png');
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
