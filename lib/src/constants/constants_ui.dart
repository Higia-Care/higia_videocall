import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kprimaryColorTheme = Color(0XFF643BF5);
const Color ksecundaryHeaderColorTheme = Color(0XFFD63DAD);
const kappBarTheme = AppBarTheme(
  color: kBottonColor,
  iconTheme: IconThemeData(color: Colors.white),
);
const Color kHigiaTitleColor = Color(0XFF391493);
const Color kHigiaCareTitleColor = Color(0XFFD63DAD);
const kBottonsActionsLogin = TextStyle(fontSize: 16, color: Colors.white);
const Color kBottonColor = Color(0XFF6202EE);
const kCircleAvatarColor = Color(0XFFE4B0D6);
const kBackGroudColor = Color(0xFFF2F2F9);
final TextStyle numbersStyle = TextStyle(
  color: kprimaryColorTheme,
  fontSize: 40,
  fontWeight: FontWeight.w700,
);
final TextStyle titlenumbersStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
);

var themeData = ThemeData(
  ///This var provide the global theme for the app
  primaryColor: kprimaryColorTheme,
  colorScheme: ColorScheme.light(
    primary: kprimaryColorTheme,
    secondary: ksecundaryHeaderColorTheme,
  ),
  textSelectionColor: kprimaryColorTheme,
  appBarTheme: kappBarTheme,
  iconTheme: IconThemeData(color: kprimaryColorTheme),
  accentColor: ksecundaryHeaderColorTheme,
  textTheme: GoogleFonts.openSansTextTheme().copyWith(
    bodyText1: TextStyle(fontSize: 18),
  ),
  cardTheme: CardTheme(
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
  buttonColor: ksecundaryHeaderColorTheme,
  primaryColorLight: kprimaryColorTheme,
);
