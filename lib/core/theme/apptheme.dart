import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';




class AppTheme{
  AppTheme._();

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: const Color(0XFFF5F5F5),
    primaryColor: AppColors.primary,
    primarySwatch:
        MaterialColor(AppColors.primary.value, AppColors.primaryPallet),
    textTheme: textTheme,
    appBarTheme: appBarTheme,
    textButtonTheme: TextButtonThemeData(style: primaryTextButtonStyle),
    unselectedWidgetColor: Colors.white,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
    color: Colors.white,
    centerTitle: true,
    titleTextStyle: appBarTitleTheme,
    iconTheme: appBarIconTheme,
    shadowColor: const Color.fromARGB(45, 0, 0, 0),
    // elevation: 1
  );

  static IconThemeData appBarIconTheme = const IconThemeData(
    color: AppColors.black,
  );

  static TextStyle appBarTitleTheme = const TextStyle();

  static TextTheme textTheme = TextTheme(
      headline1: headline1,
      headline6: headline6,
      bodyText1: bodyText1,
      bodyText2: bodyText2);

  static TextStyle headline1 = GoogleFonts.workSans(
      fontWeight: FontWeight.w700, fontSize: 34, color: Colors.white);

  static TextStyle headline6 = GoogleFonts.workSans(
      fontWeight: FontWeight.w600, fontSize: 12, color: Colors.black);

  static TextStyle bodyText1 = GoogleFonts.workSans(
      fontWeight: FontWeight.w400, fontSize: 13, color: Colors.white);

  static TextStyle bodyText2 = GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: const Color(0xff1A1A1A));

  static ButtonStyle primaryTextButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 23),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      backgroundColor: const Color(0XFF2689FB),
      primary: Colors.white,
      textStyle: buttonTextStyle);

  static const buttonTextStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.white);
}