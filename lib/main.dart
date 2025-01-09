
import 'package:bdcalling_task/modules/home/view/home_view.dart';
import 'package:bdcalling_task/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'config/font_dynamic.dart';
import 'modules/assignment_three/model/data_fetch_model.dart';


int? isInitScreen;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeView(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
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


