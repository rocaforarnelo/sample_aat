import 'package:flutter/material.dart';
import 'package:photo_app/core/presentation/theme/colors.dart';

class CustomTheme {
  CustomTheme._();

  static TextButtonThemeData lightTextButtonThemeData = TextButtonThemeData(
    style: primaryButtonStyle,
  );

  static ButtonStyle primaryButtonStyle = TextButton.styleFrom(
    elevation: 8,
    minimumSize: const Size.fromHeight(40),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    backgroundColor: CustomColors.primary,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(color: Colors.white, fontSize: 12),
  );

  static ThemeData light = ThemeData.light().copyWith(
    colorScheme:
        const ColorScheme.light().copyWith(background: CustomColors.primary),
    textButtonTheme: lightTextButtonThemeData,
  );
}
