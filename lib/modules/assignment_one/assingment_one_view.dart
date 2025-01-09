import 'package:bdcalling_task/config/font_dynamic.dart';
import 'package:bdcalling_task/config/responsice_scale.dart';
import 'package:bdcalling_task/const/app_images.dart';
import 'package:bdcalling_task/const/text_style.dart';
import 'package:bdcalling_task/modules/assignment_one/widget/all_tab_view.dart';
import 'package:bdcalling_task/modules/assignment_one/widget/search_bar.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class AssignmentOneView extends StatefulWidget {
  const AssignmentOneView({super.key});

  @override
  State<AssignmentOneView> createState() => _AssignmentOneViewState();
}

class _AssignmentOneViewState extends State<AssignmentOneView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          color: const Color(0xff11161F),
          child: Column(
            children: [
              verticalGap(context, 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Tanjid",
                        style: customTextStyleWhite(TextSize.font20(context)),
                      ),
                      Text("Let\'s watch today",
                          style: customTextStyleWhite(TextSize.font14(context),
                              color: Colors.grey)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    backgroundImage: AssetImage(AppImages.profile),
                  )
                ],
              ),
              verticalGap(context, 1.5),
              Row(
                children: [
                  Expanded(
                    child: CustomSearchBar(
                      controller: TextEditingController(),
                      onChanged: (value) {
                        // Handle search logic
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color(0xffFF3440),
                    ),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: TextSize.font28(context),
                    ),
                  ),
                ],
              ),
              verticalGap(context, 2),
              buildSegmentRow(context, "Categories"),
              verticalGap(context, 1),
              ButtonsTabBar(
                tabs: const [
                  Tab(text: "All"),
                  Tab(text: "Action"),
                  Tab(text: "Anime"),
                  Tab(text: "Sci-fi"),
                  Tab(text: "Thriller"),
                ],
                backgroundColor: const Color(0xffFF3440),
                unselectedBackgroundColor: Colors.grey.shade700,
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: TextSize.font16(context)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                labelSpacing: 20,
                buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              Expanded(
                child: TabBarView(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: AllTabView(),
                  ),
                  Center(
                    child: Text(
                      "Action",
                      style: customTextStyle(TextSize.font18(context),
                          color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Anime",
                      style: customTextStyle(TextSize.font18(context),
                          color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Sci-fi",
                      style: customTextStyle(TextSize.font18(context),
                          color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Thriller",
                      style: customTextStyle(TextSize.font18(context),
                          color: Colors.white),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildSegmentRow(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: customTextStyleWhite(TextSize.font18(context)),
        ),
        Text(
          'See More',
          style: customTextStyleWhite(TextSize.font14(context)),
        ),
      ],
    );
  }
}
