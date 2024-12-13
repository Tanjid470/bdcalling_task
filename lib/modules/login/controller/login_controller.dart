import 'dart:convert';

import 'package:bdcalling_task/core/const/http_logger.dart';
import 'package:bdcalling_task/core/helper/helpers.dart';
import 'package:bdcalling_task/core/utils/app_url.dart';
import 'package:bdcalling_task/global/network_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool saveButtonEnableFlag =false.obs;


  void saveButtonEnable(){
    if(emailController.text.isNotEmpty
        && passwordController.text.isNotEmpty){
      saveButtonEnableFlag.value = true;
    }
    else{
      saveButtonEnableFlag.value = false;
    }
  }

  Future<void> loginAccount() async {
    SmartDialog.showLoading();
    if (await NetworkCheck().checkInternetConnectivity()) {
      var getResponse = await postLoginAccount();
      if (getResponse != null) {
        // if(preferences.getBool('isVerified') == true){
        //   SmartDialog.dismiss();
        //   Get.offAllNamed(Routes.Bottom_Navigator_Bar,
        //       arguments: selectedValueSemester.toString());
        // }
        // else{
        //   otpController.onOtpController();
        //   Future.delayed(const Duration(seconds: 3), () async{
        //     await otpController.sentOtp();
        //     SmartDialog.dismiss();
        //     Get.to(() => const VerificationView());
        //   });
        // }
        // // Get.offAllNamed(Routes.Bottom_Navigator_Bar,
        // //     arguments: selectedValueSemester.toString());
      }
      else {
        SmartDialog.dismiss();
      }
    }
    else {
      SmartDialog.dismiss();
      Helpers.showSnackbar(title: 'No internet',message: '');
    }
  }


  Map<String, String> headerForLogin = {
    'content-type': 'application/json'
  };
  Future postLoginAccount() async {
    try {
      String url = AppUrl.postLoginAccount;
      Map bodyData = {
        "email": emailController.text,
        "password": passwordController.text,
      };
      var response = await httpLog.post(Uri.parse(url),
          headers: headerForLogin,
          body: jsonEncode(bodyData)
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