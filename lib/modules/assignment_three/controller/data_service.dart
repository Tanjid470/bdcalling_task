import 'dart:developer';

import 'package:bdcalling_task/core/const/http_logger.dart';
import 'package:bdcalling_task/modules/assignment_three/model/data_fetch_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';


class DataService {
  final String apiUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List<DataModel>> fetchData() async {
    try {
      final response = await httpLog.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        final data = jsonData.map((e) => DataModel.fromJson(e)).toList();

        // Cache data locally
        final box = await Hive.openBox<DataModel>('dataBox');
        await box.clear(); // Clear old data
        await box.addAll(data);
        return data;
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (e) {
      // Fallback to cached data
      final box = await Hive.openBox<DataModel>('dataBox');
      return box.values.toList();
    }
  }
}
