import 'package:flutter/material.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';

abstract class AppTextTheme {
  static TextTheme light = TextTheme(
    headlineLarge: TextStyle(
      color: AppColorTheme.defaultBlack,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: 16,
    ),
    headline1: TextStyle(
      color: AppColorTheme.defaultBlack,
      fontSize: 14,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      color: AppColorTheme.defaultWhite,
      fontStyle: FontStyle.normal,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: AppColorTheme.defaultBlack,
      fontStyle: FontStyle.normal,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      color: AppColorTheme.defaultWhite,
      fontStyle: FontStyle.normal,
      fontSize: 12,
    ),
  );

  static TextTheme dark = TextTheme(
    headlineLarge: TextStyle(
      color: AppColorTheme.defaultWhite,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: 16,
    ),
    headline1: TextStyle(
      color: AppColorTheme.defaultWhite,
      fontSize: 14,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      color: AppColorTheme.defaultBlack,
      fontStyle: FontStyle.normal,
      fontSize: 14,
    ),
    bodyText1: TextStyle(
      color: AppColorTheme.defaultWhite,
      fontStyle: FontStyle.normal,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      color: AppColorTheme.defaultBlack,
      fontStyle: FontStyle.normal,
      fontSize: 12,
    ),
  );
}
