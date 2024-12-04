import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = "https://muhtest.runasp.net/api";

  static final Dio dioHelper = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await dioHelper.get(endPoint);
    return response.data;
  }

  static Future<Map<String, dynamic>> postData(
      String endPoint, Map<String, dynamic> query) async {
    var response = await dioHelper.post(endPoint, queryParameters: query);
    return response.data;
  }
}
