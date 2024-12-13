import 'dart:convert';
import 'package:bdcalling_task/core/const/http_logger.dart';
import 'package:bdcalling_task/core/helper/helpers.dart';
import 'package:bdcalling_task/core/utils/app_url.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';



class RegisterAccountController extends GetxController {

  TextEditingController firstNameController = TextEditingController();
  RxString firstNameErrorMassage = ''.obs;
  RxBool inputValidFirstName = false.obs;
  firstNameInputValidation(){
    if(firstNameController.text.isEmpty){
      firstNameErrorMassage('Enter your first name');
      inputValidFirstName.value = false;
    }
    else{
      firstNameErrorMassage.value = '';
      inputValidFirstName.value = true;
    }
    update();
  }

  TextEditingController lastNameController = TextEditingController();
  RxString lastNameErrorMassage = ''.obs;
  RxBool inputValidLastName = false.obs;
  lastNameInputValidation(){
    if(firstNameController.text.isEmpty){
      firstNameErrorMassage('Enter your first name');
      inputValidLastName.value = false;
    }
    else{
      firstNameErrorMassage.value = '';
      inputValidLastName.value = true;
    }
    update();
  }

  TextEditingController emailController = TextEditingController();
  RxString userEmailErrorMassage = ''.obs;
  RxBool inputValidUserEmail = false.obs;
  userEmailInputValidation(){
    bool emailValid = RegExp(
        r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
    ).hasMatch(emailController.text);

    if(emailController.text.isEmpty){
      userEmailErrorMassage('আপনার ইমেইল লিখুন');
      inputValidUserEmail.value = false;
    }
    else if(emailValid != true){
      userEmailErrorMassage('আপনার ইমেইল সঠিক নয়');
      inputValidUserEmail.value = false;
    }
    else{
      userEmailErrorMassage.value = '';
      inputValidUserEmail.value = true;
    }

    update();
  }

  TextEditingController passwordController = TextEditingController();
  RxString passwordErrorMassage = ''.obs;
  RxBool inputValidPassword = false.obs;
  passwordInputValidation(){
    if(firstNameController.text.isEmpty){
      firstNameErrorMassage('Enter your first name');
      inputValidFirstName.value = false;
    }
    else{
      firstNameErrorMassage.value = '';
      inputValidFirstName.value = true;
    }
    update();
  }

  RxString filePath="".obs;

  RxBool saveButtonEnableFlag =false.obs;


  void saveButtonEnable(){
    if(emailController.text.isNotEmpty
        && firstNameController.text.isNotEmpty
        && firstNameController.text.isNotEmpty
        && passwordController.text.isNotEmpty){
      saveButtonEnableFlag.value = true;
    }
    else{
      saveButtonEnableFlag.value = false;
    }
  }

  Future<bool> checkInternetConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
    await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // // print('Mobile');
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // // print('Wifi');
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // print('No Connection');
      return false;
    } else {
      return false;
    }
  }

  Future<void> registerAccount() async {
    SmartDialog.showLoading();
    if (await checkInternetConnectivity()) {
      var getResponse = await postRegisterAccount();
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



  Future postRegisterAccount() async {
    String url = AppUrl.postRegisterAccount;
    Map bodyData = {
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "file": filePath.value
    };
    try {
      var response = await httpLog.post(Uri.parse(url),
          body: jsonEncode(bodyData));
      final map = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
       // ProfileModel model = ProfileModel.fromJson(map['data']);
        Get.snackbar(map['status'], map['message'],
            duration: const Duration(seconds: 3),
            backgroundColor: const Color(0xffC9EFDE),
            colorText: Colors.black,
            icon: const Icon(Icons.offline_pin_outlined,color: Color(0xff14452F),),
            snackPosition: SnackPosition.TOP);
       // return model;
      }
      else {
        Get.snackbar(map['status'], map['message'],
            duration: const Duration(seconds: 5),
            backgroundColor: const Color(0xffFFCECE),
            colorText: Colors.black,
            icon: const Icon(Icons.error_outline,color: Color(0xffEF4444),),
            snackPosition: SnackPosition.TOP);
        return null;
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
    return null;
  }

}