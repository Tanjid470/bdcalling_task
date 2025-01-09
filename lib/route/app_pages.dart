import 'package:bdcalling_task/main.dart';
import 'package:bdcalling_task/modules/assignment_one/assingment_one_view.dart';
import 'package:bdcalling_task/modules/home/view/home_view.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';


part 'app_routes.dart';
class AppPages{
  AppPages._();

  static String INITIAL = isInitScreen == 0 || isInitScreen == null
      ? Routes.homeScreen
      : Routes.homeScreen;
  static final routes =[
    GetPage(
      name:_Paths.homeScreen,
      page: () => const HomeView(),
      transition: Transition.leftToRight,
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name:_Paths.assignmentOneView,
      page: () => const AssignmentOneView(),
      transition: Transition.leftToRight,
      curve: Curves.fastOutSlowIn,
    ),


  ];
}