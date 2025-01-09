
import 'package:bdcalling_task/config/font_dynamic.dart';
import 'package:bdcalling_task/config/responsice_scale.dart';
import 'package:bdcalling_task/const/text_style.dart';
import 'package:bdcalling_task/modules/assignment_one/controller/assignment_one_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTabView extends StatefulWidget {
  const AllTabView({super.key});

  @override
  State<AllTabView> createState() => _AllTabViewState();
}

class _AllTabViewState extends State<AllTabView> {
  AssignmentOneController assignmentOneController = Get.put(AssignmentOneController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 5,
              child: CarouselSlider.builder(
                itemCount: assignmentOneController.splashList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                        color : Colors.transparent,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image:AssetImage(assignmentOneController.splashList[index]),
                            fit: BoxFit.cover
                        )
                    ),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height, // Adjust height accordingly
                  autoPlay: true,  // Enable auto-play
                  autoPlayInterval: const Duration(seconds: 3),  // Time between transitions
                  enlargeCenterPage: true, // Enlarge the current item
                  viewportFraction: 1.0, // Display one item at a time
                  onPageChanged: (index, reason) {
                    assignmentOneController.changePage(index);
                  },
                ),
              ),
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(assignmentOneController.splashList.length, (index) {
                  return InkWell(
                    onTap: () => assignmentOneController.changePage(index),
                    child: Container(
                      width: assignmentOneController.selectedPage.value == index ? 10.0 : 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(7)),
                        color: assignmentOneController.selectedPage.value == index
                            ? Colors.white
                            : const Color(0xff4F5055),
                      ),
                    ),
                  );
                }),
              );
            }),
            buildSegmentRow(context,"Trending Movies"),
            verticalGap(context, 1),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: assignmentOneController.trendingMovie.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(image: AssetImage(assignmentOneController.trendingMovie.keys.elementAt(index)))
                          ),
                        ),
                        Text(assignmentOneController.trendingMovie.values.elementAt(index),style: customTextStyleWhite(TextSize.font14(context)),)
                      ],
                    );
              },),
            ),
            verticalGap(context, 2),
            buildSegmentRow(context,"Continue Watching"),
            verticalGap(context, 1),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: assignmentOneController.continueWatching.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 120,
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(image: AssetImage(assignmentOneController.continueWatching.keys.elementAt(index)),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        Text(assignmentOneController.continueWatching.values.elementAt(index),style: customTextStyleWhite(TextSize.font14(context)),)
                      ],
                    );
              },),
            ),
            verticalGap(context, 2),
            buildSegmentRow(context,"Recommended For You"),
            verticalGap(context, 1),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: assignmentOneController.trendingMovie.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(image: AssetImage(assignmentOneController.trendingMovie.keys.elementAt(index)))
                        ),
                      ),
                      Text(assignmentOneController.trendingMovie.values.elementAt(index),style: customTextStyleWhite(TextSize.font14(context)),)
                    ],
                  );
                },),
            ),
            
      
          ],
        )
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
