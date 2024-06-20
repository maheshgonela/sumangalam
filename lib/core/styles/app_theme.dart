import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sumangalam/core/styles/color_scheme.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = _buildTheme(lightColorScheme);
  static final darkTheme = _buildTheme(darkColorScheme);

  static ThemeData _buildTheme(ColorScheme scheme) => ThemeData(
        textTheme: GoogleFonts.quicksandTextTheme(),
        colorScheme: scheme,
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(),
          ),
        ),
        brightness: scheme.brightness,
      );
}
