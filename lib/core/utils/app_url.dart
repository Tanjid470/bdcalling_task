

import 'app_config.dart';

class AppUrl {
  AppUrl._();
  static String baseUrlWithApiVersion = AppConfig.baseUrl;
  static String postRegisterAccount = "$baseUrlWithApiVersion/user/register";
  static String postLoginAccount = "$baseUrlWithApiVersion/user/login";
  static String postActiveAccount = "$baseUrlWithApiVersion/user/activate-user";

}
