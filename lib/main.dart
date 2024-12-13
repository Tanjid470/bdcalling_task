import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'config/font_dynamic.dart';
import 'modules/login/view/login_screen_view.dart';
import 'modules/register_account/view/register_account_view.dart';

void main() async{
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      //home: const RegisterAccountScreen(),
      home: const LoginView(),

      builder: FlutterSmartDialog.init(
        toastBuilder: (String msg) => Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.red.shade300
            ),
            child: Text(msg,
              style:   TextStyle(
                color: Colors.white,
                fontSize: TextSize.font16(context),
              ),
            ),
          ),
        ),
        loadingBuilder: (String msg) => const CircularProgressIndicator()
      ),
    );
  }
}


