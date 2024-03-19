import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class Loaders {
  static void showToast({required String message, required ToastState type}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: getToastColor(type),
        textColor: AppColors.dark,
        fontSize: 16.0);
  }
}

enum ToastState { success, error, warning }

Color getToastColor(ToastState state) {
  switch (state) {
    case ToastState.success:
      return AppColors.primaryColor;
    case ToastState.error:
      return AppColors.red;
    case ToastState.warning:
      return AppColors.orange;
  }
}
