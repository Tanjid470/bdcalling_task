
import 'dart:convert';

import 'package:bdcalling_task/core/const/http_logger.dart';
import 'package:bdcalling_task/core/utils/app_url.dart';
import 'package:bdcalling_task/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Map<String, String> headerData = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${preferences.getString('access_token')}',
  };
  Future createTask() async {
    try {
      String url = AppUrl.postCreateTask;
      Map bodyData = {
        "title": titleController.text,
        "description": descriptionController.text,
      };
      var response = await httpLog.post(Uri.parse(url),
          headers: headerData,
          body: jsonEncode(bodyData)
      );
      final map = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        titleController.clear();
        descriptionController.clear();
        Get.snackbar(map['status'], map['message'],
            duration: const Duration(seconds: 3),
            backgroundColor: const Color(0xffC9EFDE),
            colorText: Colors.black,
            icon: const Icon(Icons.offline_pin_outlined,color: Color(0xff14452F),),
            snackPosition: SnackPosition.TOP);

      }
      else {
        Get.snackbar(map['status'], map['message'],
            duration: const Duration(seconds: 5),
            backgroundColor: const Color(0xffFFCECE),
            colorText: Colors.black,
            icon: const Icon(Icons.error_outline,color: Color(0xffEF4444),),
            snackPosition: SnackPosition.TOP);

      }

    }
    catch (exception) {
      Get.snackbar('Error','$exception',
          duration: const Duration(seconds: 3),
          backgroundColor: const Color(0xfff1d799),
          colorText: Colors.black,
          icon: const Icon(Icons.wifi_tethering_error,color: Color(0xffEF4444),),
          snackPosition: SnackPosition.TOP);
    }

  }
}