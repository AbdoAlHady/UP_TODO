import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData getAppTheme() => ThemeData(
    scaffoldBackgroundColor:AppColors.backGround,
    primaryColor: AppColors.primaryColor,

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backGround,
      elevation: 0,
      centerTitle: true
    ),

    // Text Theme
  );
}
