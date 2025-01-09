import 'package:bdcalling_task/modules/assignment_three/model/data_fetch_model.dart';
import 'package:get/get.dart';
import 'data_service.dart';

class DataController extends GetxController {
  var data = <DataModel>[].obs;
  var isLoading = true.obs;

  final DataService dataService;

  DataController(this.dataService);

  void loadData() async {
    try {
      isLoading.value = true;
      data.value = await dataService.fetchData();
    } finally {
      isLoading.value = false;
    }
  }
}
