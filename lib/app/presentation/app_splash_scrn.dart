import 'package:flutter/material.dart';
import 'package:sumangalam/core/styles/app_icon.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(child: Image.asset(AppIcons.appLogo.path)),
    );
  }
}