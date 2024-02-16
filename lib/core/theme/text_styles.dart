import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/helpers/font_weight_helper.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class TextStyles {
  static  TextStyle font16WhiteRegular =GoogleFonts.lato(fontSize: 16.sp, fontWeight: FontWeightHelpers.regular,color: AppColors.white.withOpacity(0.44));
  static  TextStyle font32WhiteBold =GoogleFonts.lato(fontSize: 32.sp, fontWeight: FontWeightHelpers.bold,color: AppColors.white);


}
