import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class AppElevatedButtonTheme {
  static ElevatedButtonThemeData lightTheme =  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      )
    ),
  );
   static ElevatedButtonThemeData darkTheme =  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      )
    ),
  );
}
