import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Helpers {
  Helpers._();


  static showSnackbar(
      {String title = '',
        String message = '',
        Color colorText = Colors.white,
        Color backgroundColor = Colors.black54,
        int seconds = 3}) {
    Get.snackbar(title, message,
        colorText: colorText,
        backgroundColor: backgroundColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: seconds));
  }


}
