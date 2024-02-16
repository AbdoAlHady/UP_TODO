import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      this.verticalPadding,
      this.horizontalPadding,
      this.buttonHeight,
      this.buttonWidth,
      required this.buttonText,
      required this.textStyle,
      required this.onPressed});
  final double? borderRadius;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius??5.0,),
        ),
        backgroundColor: backgroundColor??AppColors.primaryColor,
        padding:  EdgeInsets.symmetric(vertical: verticalPadding?.h??12.h,horizontal: horizontalPadding?.w??24.w),
        fixedSize: Size(buttonWidth?.w?? double.maxFinite,buttonHeight?.h?? 50.h)
      ),
      child: Text(buttonText,style: textStyle,),
    );
  }
}