import 'package:flutter/cupertino.dart';
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
}