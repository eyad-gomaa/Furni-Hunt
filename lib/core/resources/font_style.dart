import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/font_size_manager.dart';

import 'color_manager.dart';

class FontStyleManager {
  static TextStyle fontStyle42 = TextStyle(
      fontSize: FontSizeManager.fontSize42, fontWeight: FontWeight.bold);
  static TextStyle fontStyle28 = TextStyle(
      fontSize: FontSizeManager.fontSize28, fontWeight: FontWeight.bold);
  static TextStyle fontStyle21 = TextStyle(
      fontSize: FontSizeManager.fontSize21, fontWeight: FontWeight.bold);
  static TextStyle fontStyle16 = TextStyle(
      fontSize: FontSizeManager.fontSize16, color: ColorManager.greyLighter);
  static TextStyle fontStyle12 = TextStyle(
      fontSize: FontSizeManager.fontSize12, color: ColorManager.greyDeeper);
}
