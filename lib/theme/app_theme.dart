import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:segarbox_flutter/theme/color_theme.dart';
import 'package:segarbox_flutter/theme/text_theme.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    cardColor: AppColorTheme.defaultWhite,
    textTheme: GoogleFonts.poppinsTextTheme(AppTextTheme.light),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    cardColor: Colors.grey,
    textTheme: GoogleFonts.poppinsTextTheme(AppTextTheme.dark),
  );

  static void systemBarColor({
    Color statusBarColor = Colors.transparent,
    Color navBarColor = AppColorTheme.defaultWhite,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          systemNavigationBarColor: navBarColor,
          systemNavigationBarIconBrightness:
              (navBarColor == AppColorTheme.defaultWhite)
                  ? Brightness.dark
                  : Brightness.light),
    );
  }
}
