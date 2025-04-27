import 'package:flutter/material.dart';

class ScreenUtils {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

class MyColors {
  static const Color appColor = Color(0xFFb7935f);
}
