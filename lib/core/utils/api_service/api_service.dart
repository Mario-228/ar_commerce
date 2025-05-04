import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';

import '../../../features/profile_feature/data/repos/update_user_repo/update_user_constants.dart';

class ApiService {
  final Dio dioHelper;
  ApiService(this.dioHelper);
  Future<Map<String, dynamic>> get(String endPoint, {String? token}) async {
    var response = await dioHelper.get(
      endPoint,
      options: Options(
        headers: {
          'ngrok-skip-browser-warning': 'true',
          if (token != null) 'Authorization': 'Bearer $token'
        },
      ),
    );
    return response.data;
  }

  Future<String> getARUrl(String endPoint, {String? token}) async {
    var response = await dioHelper.get(
      endPoint,
      options: Options(
        headers: {
          'ngrok-skip-browser-warning': 'true',
          if (token != null) 'Authorization': 'Bearer $token'
        },
      ),
    );
    return response.data;
  }

  Future getFavourites(String endPoint, {String? token}) async {
    var response = await dioHelper.get(
      endPoint,
      options: Options(
        headers: {
          'ngrok-skip-browser-warning': 'true',
          if (token != null) 'Authorization': 'Bearer $token'
        },
      ),
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

  Future<Map<String, dynamic>> postDataWithToken(
      String endPoint, String token, Map<String, dynamic> query) async {
    var response = await dioHelper.post(
      endPoint,
      queryParameters: query,
      options: Options(headers: {
        'ngrok-skip-browser-warning': 'true',
        'Authorization': 'Bearer $token',
      }),
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

  Future<Map<String, dynamic>> getWithToken(
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

  Future<Map<String, dynamic>> postWithTokenAndImage(
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

  Future<Map<String, dynamic>> postWithImage(
      String endPoint, Map<String, dynamic> query) async {
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
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postDataWithTokenAndQuery({
    required String endPoint,
    required String token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    var response = await dioHelper.post(
      endPoint,
      queryParameters: query,
      data: FormData.fromMap(data),
      options: Options(headers: {
        'ngrok-skip-browser-warning': 'true',
        'Authorization': 'Bearer $token',
      }),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> deleteWithToken(String endPoint) async {
    var response = await dioHelper.delete(
      endPoint,
      options: Options(
        headers: {
          'ngrok-skip-browser-warning': 'true',
          'Authorization': 'Bearer ${CacheHelper.getUserData().token}'
        },
        contentType: 'application/json',
      ),
    );
    return response.data;
  }

  Future<Response> stripePostData({
    required Map<String, dynamic> parameters,
    required String endPoint,
    required String token,
    String? contentType,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dioHelper.post(
      endPoint,
      queryParameters: parameters,
      options: Options(
        contentType: contentType,
        headers: headers ??
            {
              "Authorization": "Bearer $token",
            },
      ),
    );
    return response;
  }

  Future<Map<String, dynamic>> putData({
    required String endPoint,
    required String token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    var response = await dioHelper.put(
      endPoint,
      queryParameters: query,
      data: data,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'ngrok-skip-browser-warning': 'true',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }
}
