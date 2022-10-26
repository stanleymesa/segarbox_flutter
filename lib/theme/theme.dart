import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

Color green = Color(0XFF02B80E);
Color softGreen = Color.fromARGB(255, 130, 240, 138);
Color defaultWhite = Color(0XFFFAFAFA);
Color black = Colors.black87;

TextStyle title = GoogleFonts.poppins().copyWith(
  color: black,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  fontSize: 16,
);

TextStyle normalDark = GoogleFonts.poppins().copyWith(
  color: black,
  fontStyle: FontStyle.normal,
  fontSize: 14,
);

TextStyle normalLight = GoogleFonts.poppins().copyWith(
  color: defaultWhite,
  fontStyle: FontStyle.normal,
  fontSize: 14,
);

TextStyle normalBold = GoogleFonts.poppins().copyWith(
  color: black,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  fontSize: 14,
);

void systemBarColor(
    {Color statusBarColor = Colors.transparent,
    Color navBarColor = Colors.white}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemNavigationBarColor: navBarColor,
        systemNavigationBarIconBrightness:
            (navBarColor == Colors.white || navBarColor == defaultWhite)
                ? Brightness.dark
                : Brightness.light),
  );
}
