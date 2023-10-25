import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/theme/app_colors.dart';

ThemeData planetDarkTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.background,
        width: MediaQuery.of(context).size.width),
    textTheme: const TextTheme(
      labelSmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 11,
        fontFamily: "LeagueSpartan",
        letterSpacing: 1.96,
        color: AppColors.lightGrey,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: AppFontConfiguration.antonio,
        fontSize: 28,
        letterSpacing: -1.05,
      ),
      titleLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        fontFamily: AppFontConfiguration.antonio,
        color: AppColors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        color: AppColors.whiteBody,
        fontWeight: FontWeight.w300,
        fontFamily: "LeagueSpartan",
        height: 1.3,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: "LeagueSpartan",
        fontSize: 15,
        color: AppColors.lightGrey,
      ),
      headlineSmall: TextStyle(
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