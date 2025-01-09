import 'package:bdcalling_task/const/app_images.dart';
import 'package:get/get.dart';

class AssignmentOneController extends GetxController{


  var selectedPage = 0.obs;
  void changePage(int value) {
    selectedPage.value = value;
  }

  List<String> splashList = [
    AppImages.four,
    AppImages.five,
    AppImages.six,
  ];
  Map<String, String> trendingMovie = {
    AppImages.one: "Alone",
    AppImages.two: "Joker",
    AppImages.three: "Free Local",
    AppImages.seven: "Batman",
    AppImages.eight: "Test",
  };
  Map<String, String> continueWatching = {
    AppImages.four: "Our Movement starts here",
    AppImages.five: "Avengers end game",
    AppImages.six: "Free Local",
  };
}