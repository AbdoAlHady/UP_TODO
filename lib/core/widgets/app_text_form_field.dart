import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helpers/helper_functions.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      required this.hintText,
      this.fillColor,
      this.borderColor,
      this.hintStyle,
      this.borderRadius,
      this.suffixIcon,
      this.height,
      this.textStyle,
      this.contentPadding,
      this.readOnly, this.controller});
  final String hintText;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final Widget? suffixIcon;
  final double? height;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final bool? readOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return TextFormField(
      controller: controller,
      
      readOnly: readOnly ?? false,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: textStyle ?? Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.titleSmall,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
          borderSide:
              BorderSide(width: 1.3, color: borderColor ?? AppColors.grey),
        ),
        focusedBorder:readOnly==true? OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
          borderSide:
              BorderSide(width: 1.3, color: borderColor ?? AppColors.grey),
        ):
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
          borderSide: BorderSide(
              width: 2, color: borderColor ?? AppColors.primaryColor),
        ),
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? (dark ? AppColors.darkerGrey : AppColors.light),
        filled: true,
      ),
      cursorColor: AppColors.primaryColor,
    );
  }
}
