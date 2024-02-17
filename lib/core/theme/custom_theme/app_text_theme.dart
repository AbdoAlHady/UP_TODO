import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../helpers/font_weight_helper.dart';
import '../../utils/app_colors.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
   displayLarge: GoogleFonts.lato(fontSize: 32.sp, fontWeight: FontWeightHelpers.bold,color: AppColors.dark),
   displayMedium: GoogleFonts.lato(fontSize: 24.sp, fontWeight: FontWeightHelpers.bold,color: AppColors.dark),
   displaySmall: GoogleFonts.lato(fontSize: 20.sp, fontWeight: FontWeightHelpers.regular,color: AppColors.dark),
   titleMedium: GoogleFonts.lato(fontSize: 16.sp, fontWeight: FontWeightHelpers.meduim,color: AppColors.dark),
   titleSmall: GoogleFonts.lato(fontSize: 16.sp, fontWeight: FontWeightHelpers.regular,color: AppColors.dark),
   
  );
  static TextTheme darkTextTheme = TextTheme(
   displayLarge: GoogleFonts.lato(fontSize: 32.sp, fontWeight: FontWeightHelpers.bold,color: AppColors.white),
  displayMedium: GoogleFonts.lato(fontSize: 24.sp, fontWeight: FontWeightHelpers.bold,color: AppColors.white),
  displaySmall: GoogleFonts.lato(fontSize: 20.sp, fontWeight: FontWeightHelpers.regular,color: AppColors.white),
   titleMedium: GoogleFonts.lato(fontSize: 16.sp, fontWeight: FontWeightHelpers.meduim,color: AppColors.white),
   titleSmall: GoogleFonts.lato(fontSize: 16.sp, fontWeight: FontWeightHelpers.regular,color: AppColors.white),
  );
}
