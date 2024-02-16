import 'package:flutter/material.dart';

class HelperFuctions {

  static bool isDarkMode(context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
    static bool isLightMode(context) {
    return Theme.of(context).brightness == Brightness.light;
  }
}
