
import 'package:bdcalling_task/config/font_dynamic.dart';
import 'package:bdcalling_task/config/responsice_scale.dart';
import 'package:bdcalling_task/const/text_style.dart';
import 'package:bdcalling_task/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomButton(onTap: () {
                Get.toNamed(Routes.assignmentOneView);
              }, text: 'Assignment 1',),
              verticalGap(context,1),
              CustomButton(onTap: () {  }, text: 'Assignment 2',),
              verticalGap(context,1),
              CustomButton(onTap: () {  }, text: 'Assignment 3',),
            ],
          ),
        ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          text,
          style: customTextStyle(
            TextSize.font18(context),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

