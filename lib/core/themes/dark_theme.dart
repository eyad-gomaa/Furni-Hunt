import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';

import '../resources/font_style.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    background: ColorManager.white,
    primary: ColorManager.primary,
    secondary: ColorManager.secondary,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: ColorManager.primary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.black, iconSize: 24.0),
  textTheme: TextTheme(
    displayLarge: FontStyleManager.fontStyle42,
    displayMedium: FontStyleManager.fontStyle28,
    displaySmall: FontStyleManager.fontStyle21,
    bodyLarge: FontStyleManager.fontStyle16.copyWith(
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: FontStyleManager.fontStyle16.copyWith(
      fontWeight: FontWeight.w500,
    ),
    bodySmall: FontStyleManager.fontStyle12.copyWith(
      fontWeight: FontWeight.w500,
    ),
    titleSmall:
        FontStyleManager.fontStyle16.copyWith(color: ColorManager.black),
    titleMedium: FontStyleManager.fontStyle12
        .copyWith(fontWeight: FontWeight.bold, color: ColorManager.black),
  ),
);
