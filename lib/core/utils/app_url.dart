

import 'app_config.dart';

class AppUrl {
  AppUrl._();
  static String baseUrlWithApiVersion = AppConfig.baseUrl;
  static String postRegisterAccount = "$baseUrlWithApiVersion/user/register";

}
