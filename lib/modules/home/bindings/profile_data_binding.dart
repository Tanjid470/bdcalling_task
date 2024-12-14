import 'package:bdcalling_task/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';


class ProfileDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController(),
    );
  }
}