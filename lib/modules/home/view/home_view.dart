import 'dart:developer';

import 'package:bdcalling_task/config/font_dynamic.dart';
import 'package:bdcalling_task/config/responsice_scale.dart';
import 'package:bdcalling_task/main.dart';
import 'package:bdcalling_task/modules/home/controller/home_controller.dart';
import 'package:bdcalling_task/modules/login/view/login_screen_view.dart';
import 'package:bdcalling_task/modules/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ProfileController profileController = Get.find();
  HomeController homeController = Get.put(HomeController());

  String formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return "N/A";
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('yyyy-MM-dd').format(date);
    } catch (e) {
      return "Invalid Date";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.blue,
                      ), // Placeholder for profile image
                    ),
                    const SizedBox(
                        width: 16), // Space between CircleAvatar and Column
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center column vertically
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the start
                      children: [
                        Text(
                          profileController.profileDataList?.firstName ??
                              "", // Replace with user's name
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          profileController.profileDataList?.email ??
                              "", // Replace with user's email or info
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.verified_outlined,
                  color: profileController.profileDataList?.isVerified == true
                      ? Colors.green
                      : Colors.red,
                ),
                title: Text(
                    profileController.profileDataList?.isVerified == true
                        ? 'Verified Account'
                        : 'Verify your account'),
              ),
              ListTile(
                leading: const Icon(Icons.security),
                title: Text(profileController.profileDataList?.activationCode
                        .toString() ??
                    ""),
              ),
              ListTile(
                leading: const Icon(Icons.perm_identity),
                title: Text(profileController.profileDataList?.sId ?? ""),
              ),
              ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: Text(profileController.profileDataList?.address ?? ""),
              ),
              ListTile(
                leading: const Icon(Icons.create_outlined),
                title: Text(
                    "Create : ${formatDate(profileController.profileDataList?.createdAt)}"),
              ),
              ListTile(
                leading: const Icon(Icons.update),
                title: Text(
                    "Update : ${formatDate(profileController.profileDataList?.updatedAt)}"),
              ),
              ListTile(
                leading: const Icon(Icons.pin),
                title: Text(
                    profileController.profileDataList?.iV.toString() ?? ""),
              ),
            ],
          ),
        ),
        body: Builder(
          builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(children: [
                SizedBox(height: ResponsiveScale.of(context).hp(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                Colors.blue, // Adjust size as needed
                            child: Text(
                              'TA', // Example initials or any widget
                              style: TextStyle(fontSize: 20),
                            ), // Optional background color
                          ),
                        ),
                        SizedBox(width: ResponsiveScale.of(context).wp(1)),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                              fontSize: TextSize.font22(context),
                              fontWeight: FontWeight.w700,
                              color: Colors.blueAccent),
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          preferences.clear();
                          Get.offAll(() => const LoginView());
                        },
                        child: const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ))
                  ],
                ),
                SizedBox(height: ResponsiveScale.of(context).hp(2)),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.05),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueAccent.shade100,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 2,
                            offset: Offset(1, 3))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Task",
                        style: TextStyle(
                            fontSize: TextSize.font20(context),
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      SizedBox(height: ResponsiveScale.of(context).hp(1)),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color:  homeController.titleController.text.isEmpty
                                ? Colors.transparent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color:  homeController.titleController.text.isEmpty
                                  ? Colors.grey.shade400
                                  : Colors.blueAccent,
                            )),
                        child: TextField(
                          controller:  homeController.titleController,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'HindSiliguri',
                              // color: HexColor('#7A7A7A'),
                              fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                            border: const OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Title',
                            hintStyle: TextStyle(
                                fontFamily: 'HindSiliguri',
                                color: Colors.grey.shade400,
                                fontSize: 16),
                            //hintStyle: const TextStyle(color: Colors.orangeAccent),
                          ),
                          onChanged: (value) {

                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(height: ResponsiveScale.of(context).hp(1)),

                      TextField(
                        controller: homeController.descriptionController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: "Description..",
                          labelStyle: TextStyle(
                            fontFamily: 'HindSiliguri',
                            color: Colors.grey.shade400,
                            fontSize: 16,
                          ),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5), // Optional rounded corners
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.blueAccent, // Change to desired focused color
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400, // Change to desired enabled color
                              width: 1,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: ResponsiveScale.of(context).hp(.5)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            homeController.createTask();
                          },
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: TextSize.font16(context),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
        ));
  }
}
