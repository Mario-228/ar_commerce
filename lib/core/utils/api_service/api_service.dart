import 'package:dio/dio.dart';

class ApiService {
  final Dio dioHelper;
  ApiService(this.dioHelper);
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

  Future<Map<String, dynamic>> signOut(
    String endPoint,
    String token,
  ) async {
    var response = await dioHelper.post(
      endPoint,
      options: Options(
        headers: {
          'ngrok-skip-browser-warning': 'true',
          'Authorization': 'Bearer $token'
        },
        contentType: 'application/json',
      ),
    );
    return response.data;
  }
}
