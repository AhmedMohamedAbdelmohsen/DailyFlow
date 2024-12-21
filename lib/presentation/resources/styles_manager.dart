import 'package:flutter/material.dart';
import 'package:daily_flow/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
    String fontFamily, double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color);
}

TextStyle getRegularLexendStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    double? wordSpacing,
    double? letterSpacing,
    double? height,
    bool? underLine}) {
  return TextStyle(
    height: height,
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.lexend,
    decoration:
        (underLine ?? false) ? TextDecoration.underline : TextDecoration.none,
  );
}

TextStyle getMediumLexendStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.medium,
      fontFamily: FontConstants.lexend,
      height: height);
}

TextStyle getSemiBoldLexendStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.lexend,
  );
}

TextStyle getBoldLexendStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.lexend,
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    height: height,
  );
}
