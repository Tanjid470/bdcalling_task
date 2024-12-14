
import 'dart:convert';

import 'package:bdcalling_task/core/const/http_logger.dart';
import 'package:bdcalling_task/core/utils/app_url.dart';
import 'package:bdcalling_task/main.dart';
import 'package:bdcalling_task/modules/home/model/all_task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    setAllTask();
    super.onInit();
  }

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


  RxBool isLoading = true.obs;
  late List<MyTasks>? allTaskList;

  Future<bool> setAllTask() async {
    var fetchAllTask = await getAllTask(AppUrl.getAllTask);
    try {
      if (fetchAllTask?.data?.myTasks?.isNotEmpty == true) {
        allTaskList = fetchAllTask?.data?.myTasks!;
        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }

  Future<AllTaskModel?> getAllTask(String endPoint) async {
    var response = await httpLog.get(Uri.parse(endPoint),headers: headerData);
    if (response != null) {
      var data = json.decode(response.body);
      if (data != null) {
        var allTaskFromJson = allTaskModelFromJson(utf8.decode(response.bodyBytes));
        return allTaskFromJson;
      }
    } else {
      return null;
    }
    return null;
  }

  Future deleteTask(String id) async {
    try {
      String url = AppUrl.deleteDeleteTask+id;
      var response = await httpLog.delete(Uri.parse(url),
          headers: headerData,
      );
      final map = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
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