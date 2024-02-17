import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/custom_theme/app_text_theme.dart';
import 'package:todo_app/core/theme/custom_theme/buttons_theme.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      // AppBar Theme
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.dark, elevation: 0, centerTitle: true),
      textTheme: AppTextTheme.lightTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.dark,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.dark,
      elevatedButtonTheme: AppElevatedButtonTheme.darkTheme,
      // AppBar Theme
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white, elevation: 0, centerTitle: true),
      textTheme: AppTextTheme.darkTextTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
      ));
}
