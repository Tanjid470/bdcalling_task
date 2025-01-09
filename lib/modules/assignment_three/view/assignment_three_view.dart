import 'package:bdcalling_task/config/font_dynamic.dart';
import 'package:bdcalling_task/const/text_style.dart';
import 'package:bdcalling_task/modules/assignment_three/controller/data_controller.dart';
import 'package:bdcalling_task/modules/assignment_three/controller/data_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AssignmentThreeView extends StatelessWidget {
  AssignmentThreeView({super.key});

  final DataController controller = Get.put(DataController(DataService()));

  @override
  Widget build(BuildContext context) {
    controller.loadData();

    return Scaffold(
      appBar: AppBar(title: const Text("Offline Data")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.data.isEmpty) {
          return const Center(child: Text("No data available"));
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                final item = controller.data[index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.id.toString(),style: customTextStyleWhite(TextSize.font20(context)),),
                      Text(item.title.toString(),style: customTextStyleWhite(TextSize.font16(context)),),
                      Text(item.completed.toString(),style: customTextStyleWhite(TextSize.font16(context),color: Colors.purple),),
                    ],
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
