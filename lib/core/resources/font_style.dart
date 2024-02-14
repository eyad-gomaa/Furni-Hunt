import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/font_size_manager.dart';

class FontStyleManager {
  static TextStyle fontStyle42(
      {FontWeight fontWeight = FontWeight.normal, required Color color}) {
    return TextStyle(
        fontSize: FontSizeManager.fontSize42,
        fontWeight: fontWeight,
        color: color);
  }

  static TextStyle fontStyle28(
      {FontWeight fontWeight = FontWeight.normal, required Color color}) {
    return TextStyle(
        fontSize: FontSizeManager.fontSize28,
        fontWeight: fontWeight,
        color: color);
  }

  static TextStyle fontStyle21(
      {FontWeight fontWeight = FontWeight.normal, required Color color}) {
    return TextStyle(
        fontSize: FontSizeManager.fontSize21,
        fontWeight: fontWeight,
        color: color);
  }

  static TextStyle fontStyle16(
      {FontWeight fontWeight = FontWeight.normal, required Color color}) {
    return TextStyle(
        fontSize: FontSizeManager.fontSize16,
        fontWeight: fontWeight,
        color: color);
  }

  static TextStyle fontStyle12(
      {FontWeight fontWeight = FontWeight.normal, required Color color}) {
    return TextStyle(
        fontSize: FontSizeManager.fontSize12,
        fontWeight: fontWeight,
        color: color);
  }
}
