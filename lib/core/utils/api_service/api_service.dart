import 'package:dio/dio.dart';

class ApiService {
  final Dio dioHelper;
  ApiService(this.dioHelper);
/*
   Dio(
    BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ),
  )
 */
  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await dioHelper.get(
      endPoint,
      options: Options(headers: {'ngrok-skip-browser-warning': 'true'}),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postData(
      String endPoint, Map<String, dynamic> query) async {
    var response = await dioHelper.post(
      endPoint,
      queryParameters: query,
      options: Options(headers: {'ngrok-skip-browser-warning': 'true'}),
    );
    return response.data;
  }
}
