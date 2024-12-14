

import 'app_config.dart';

class AppUrl {
  AppUrl._();
  static String baseUrlWithApiVersion = AppConfig.baseUrl;
  static String postRegisterAccount = "$baseUrlWithApiVersion/user/register";
  static String postLoginAccount = "$baseUrlWithApiVersion/user/login";
  static String postActiveAccount = "$baseUrlWithApiVersion/user/activate-user";
  static String getMyProfile = "$baseUrlWithApiVersion/user/my-profile";
  ///task
  static String postCreateTask = "$baseUrlWithApiVersion/task/create-task";
  static String getAllTask = "$baseUrlWithApiVersion/task/get-all-task";
  static String deleteDeleteTask = "$baseUrlWithApiVersion/task/delete-task/";
}
