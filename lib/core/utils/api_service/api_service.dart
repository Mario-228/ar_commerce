import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';

import '../../../features/profile_feature/data/repos/update_user_repo/update_user_constants.dart';

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

  Future<Map<String, dynamic>> getUser(
    String endPoint,
    String token,
  ) async {
    var response = await dioHelper.get(
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

  Future<Map<String, dynamic>> postWithToken(
      String endPoint, String token, Map<String, dynamic> query) async {
    if (query.containsKey(UpdateUserConstants.imageKey) &&
        query[UpdateUserConstants.imageKey] is File) {
      File imageFile = query[UpdateUserConstants.imageKey];
      String fileName = path.basename(imageFile.path);

      query[UpdateUserConstants.imageKey] = await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      );
    }
    FormData formData = FormData.fromMap(query);
    var response = await dioHelper.post(
      endPoint,
      data: formData,
      options: Options(
        headers: {
          'ngrok-skip-browser-warning': 'true',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }
}
