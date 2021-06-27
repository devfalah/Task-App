import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String personPlaceholderImage =
    'https://firebasestorage.googleapis.com/v0/b/task-2e14b.appspot.com/o/learningServices.png?alt=media&token=677d2316-beb1-4f46-8a51-3c50fb0aef81';

const Color kLightSecondaryColor = Color(0xFFF6F6F6);
const Color mainColor = Color(0xFF7349FE);
const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);

const kAccentColor = Color(0xFFFFC107);
const kSpacingUnit = 10;

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: GoogleFonts.nunitoSansTextTheme(
    ThemeData.light().textTheme.apply(
          bodyColor: kLightSecondaryColor,
          displayColor: kLightSecondaryColor,
        ),
  ),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: GoogleFonts.nunitoSansTextTheme(
    ThemeData.light().textTheme.apply(
          bodyColor: kDarkSecondaryColor,
          displayColor: kDarkSecondaryColor,
        ),
  ),
);
