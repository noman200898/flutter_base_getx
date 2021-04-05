import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'dimens.dart';

class AppThemes {
  final lightTheme = ThemeData(
    primaryColor: white,
    primaryColorDark: black,
    accentColor: accent,
    cardColor: white,
    canvasColor: white,
    hintColor: black_5,
    textTheme: TextThemes.lightTextTheme,
    disabledColor: light_grey,
    shadowColor: light_grey_white,
  );

  final darkTheme = ThemeData(
    primaryColor: black,
    primaryColorDark: white,
    accentColor: red,
    cardColor: black,
    canvasColor: black,
    hintColor: light_grey_white,
    textTheme: TextThemes.darkTextTheme,
    disabledColor: light_grey,
    shadowColor: light_grey_white,
  );
}

class TextThemes {
  static final lightTextTheme = TextTheme(
    headline1: GoogleFonts.lato(
        color: white, fontSize: dp30, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.lato(
        color: black, fontSize: dp20, fontWeight: FontWeight.bold),
    headline3: GoogleFonts.lato(
        color: black, fontSize: dp24, fontWeight: FontWeight.bold),
    headline4: GoogleFonts.lato(
        color: white, fontSize: dp16, fontWeight: FontWeight.bold),
    headline5: GoogleFonts.lato(
        color: white, fontSize: dp16, fontWeight: FontWeight.normal),
    headline6: GoogleFonts.lato(color: white, fontSize: dp20),
    subtitle1: GoogleFonts.lato(
      color: white,
      fontSize: dp14,
    ),
    subtitle2: GoogleFonts.lato(color: grey, fontSize: dp14),
    bodyText1: GoogleFonts.lato(
      color: black_5,
      fontSize: dp16,
    ),
    bodyText2: GoogleFonts.lato(
        color: accent, fontSize: dp16, fontWeight: FontWeight.bold),
    button: GoogleFonts.lato(
        color: black, fontSize: dp20, fontWeight: FontWeight.bold),
  );

  static final darkTextTheme = TextTheme(
    headline1: GoogleFonts.lato(
        color: black, fontSize: dp30, fontWeight: FontWeight.bold),
    headline2: GoogleFonts.lato(
        color: white, fontSize: dp20, fontWeight: FontWeight.bold),
    headline3: GoogleFonts.lato(
        color: white, fontSize: dp24, fontWeight: FontWeight.bold),
    headline4: GoogleFonts.lato(
        color: black, fontSize: dp16, fontWeight: FontWeight.bold),
    headline5: GoogleFonts.lato(
        color: black, fontSize: dp16, fontWeight: FontWeight.normal),
    headline6: GoogleFonts.lato(color: black, fontSize: dp20),
    subtitle1: GoogleFonts.lato(
      color: black,
      fontSize: dp14,
    ),
    subtitle2: GoogleFonts.lato(color: grey, fontSize: dp14),
    bodyText1: GoogleFonts.lato(
      color: black_5,
      fontSize: dp16,
    ),
    bodyText2: GoogleFonts.lato(
        color: accent, fontSize: dp16, fontWeight: FontWeight.bold),
    button: GoogleFonts.lato(
        color: white, fontSize: dp20, fontWeight: FontWeight.bold),
  );
}
