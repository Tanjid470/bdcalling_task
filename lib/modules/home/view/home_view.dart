import 'package:bdcalling_task/config/font_dynamic.dart';
import 'package:bdcalling_task/config/responsice_scale.dart';
import 'package:bdcalling_task/main.dart';
import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: ResponsiveScale.of(context).hp(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue, // Adjust size as needed
                      child: Text(
                        'TA', // Example initials or any widget
                        style: TextStyle(fontSize: 20),
                      ), // Optional background color
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
                    },
                    child: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ))
              ],
            ),
            Text(preferences.getString('access_token').toString()),
          ],
        ),
      ),
    );
  }
}
