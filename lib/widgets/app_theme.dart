import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';

class AppFontConfiguration {
  /* Fonts configurations */

  static const antonio = "Antonio";

  static const double mainTitleSize = 40.0;
  static const FontWeight mainTitleWeight = FontWeight.w300;

  static const double mainInfoFontSize = 17.0;
  static const FontWeight mainInfoFontWeight = FontWeight.w300;

  static const leagueFont = "LeagueSpartan";

  final FontWeight buttonBarBold = FontWeight.w700;

  final double buttonBarFontSize = 11.0;
  final double buttonBarSpacing = 1.96;

  static const FontWeight leftTextFontWeight = FontWeight.w700;
  static const double leftTextFontSize = 15;

  static const FontWeight rightTextFontWeight = FontWeight.w400;
  static const double rightTextFontSize = 25;
  static const double rightTextSpacing = -0.75;

  final FontWeight regular = FontWeight.w300;
}

ThemeData PlanetTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: AppFontConfiguration.antonio,
        fontSize: 28,
        letterSpacing: -1.05,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 11,
        fontFamily: "LeagueSpartan",
        letterSpacing: 1.96,
        color: AppColors.lightGrey,
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: "LeagueSpartan",
        fontSize: 20,
        letterSpacing: 1.36,
        color: AppColors.white,
      ),
      headline3: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        fontFamily: AppFontConfiguration.antonio,
        color: AppColors.white,
      ),
      bodyText1: TextStyle(
        fontSize: 17,
        color: AppColors.whiteBody,
        fontWeight: FontWeight.w300,
        fontFamily: "LeagueSpartan",
        height: 1.3,
      ),
      headline1: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: "LeagueSpartan",
        fontSize: 15,
        color: AppColors.lightGrey,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: AppFontConfiguration.antonio,
        fontSize: 25,
        color: AppColors.white,
        letterSpacing: -0.75,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: null,
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        splashFactory: NoSplash.splashFactory,
      ),
    ),
  );
}
