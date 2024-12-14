

import 'dart:convert';

import 'package:bdcalling_task/core/const/http_logger.dart';
import 'package:bdcalling_task/core/utils/app_url.dart';
import 'package:bdcalling_task/main.dart';
import 'package:bdcalling_task/modules/profile/model/profile_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  RxBool isLoading = true.obs;
  Data? profileDataList;

  @override
  void onInit() {
    setProfileData();
    super.onInit();
  }

  Map<String, String> headerData = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${preferences.getString('access_token')}',
  };
  Future<bool> setProfileData() async {
    var fetchProfileData = await getProfileData(AppUrl.getMyProfile);
    try {
      if (fetchProfileData?.data != null) {
        profileDataList = fetchProfileData?.data ;
        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }

  Future<ProfileDataModel?> getProfileData(String endPoint) async {
    var response = await httpLog.get(Uri.parse(endPoint),headers: headerData);
    if (response != null) {
      var data = json.decode(response.body);
      if (data != null) {
        var allEbooksFromJson =
        profileDataModelFromJson(utf8.decode(response.bodyBytes));
        return allEbooksFromJson;
      }
    } else {
      return null;
    }
    return null;
  }
}