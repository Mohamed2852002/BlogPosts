import 'package:flutter/material.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/constants.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.surfaceColor,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: kCairoFamily,
  );
}
