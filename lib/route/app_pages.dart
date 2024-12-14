
import 'package:bdcalling_task/main.dart';
import 'package:bdcalling_task/modules/home/bindings/profile_data_binding.dart';
import 'package:bdcalling_task/modules/home/view/home_view.dart';
import 'package:bdcalling_task/modules/login/view/login_screen_view.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';


part 'app_routes.dart';
class AppPages{
  AppPages._();

  static String INITIAL = isInitScreen == 0 || isInitScreen == null
      ? Routes.loginScreen
      : Routes.homeScreen;
  static final routes =[
    GetPage(
      name:_Paths.homeScreen,
      page: () => const HomeView(),
      transition: Transition.leftToRight,
      curve: Curves.fastOutSlowIn,
      binding: ProfileDataBinding()
    ),
    GetPage(
      name:_Paths.loginScreen,
      page: () => const LoginView(),
      transition: Transition.leftToRight,
      curve: Curves.fastOutSlowIn,
    ),

  ];
}