import 'dart:io';

import 'package:dio/dio.dart';

import '../models/demo_response_model.dart';

class GetDemoDataService {
  static final Dio dio = Dio();
  static Future<List<DemoResponseModel>?> getDemoData() async {

    var url = 'https://jsonplaceholder.typicode.com/albums';
    try {
      var response = await dio.get(
          url,
      );
        print('responsedata: ${response.data}');
      final data = response.data as List<dynamic>;
      final demoData = data.map((albumJson) => DemoResponseModel.fromJson(albumJson)).toList();
        return demoData;

    } catch (e) {
      if (e is SocketException) {
      } else if (e is DioError) {
        var statuscode1 = e.response?.statusCode;
        print(statuscode1);
      } else {}
    }
    return null;
  }
}