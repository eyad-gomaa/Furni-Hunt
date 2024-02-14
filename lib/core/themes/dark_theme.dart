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
    displayLarge: FontStyleManager.fontStyle42(
      color: ColorManager.black,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: FontStyleManager.fontStyle28(
      color: ColorManager.black,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: FontStyleManager.fontStyle21(
      color: ColorManager.black,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: FontStyleManager.fontStyle16(
      color: ColorManager.greyDeep,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: FontStyleManager.fontStyle16(
      color: ColorManager.black,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: FontStyleManager.fontStyle12(
      color: ColorManager.greyDeep,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: FontStyleManager.fontStyle16(color: ColorManager.black),
    titleMedium: FontStyleManager.fontStyle12(
        fontWeight: FontWeight.bold, color: ColorManager.black),
  ),
);
