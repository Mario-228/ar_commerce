import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project_new_version/features/login_feature/data/models/login_output_model.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import '../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../../core/utils/cache_helper/cache_helper_keys.dart';
import 'login_repo.dart';
import 'login_repo_constants.dart';

class LoginRepoImplementations extends LoginRepo {
  @override
  Future<Either<Errors, LoginOutputModel>> login(
      {required String email, required String password}) async {
    try {
      var response = await ApiService(BaseUrl.authentication).postData(
          LoginRepoConstants.login, {"email": email, "password": password});
      if (response.containsKey('error')) {
        return left(ServerError(errorMessage: response['error']));
      }
      LoginOutputModel result = LoginOutputModel.fromJson(response);
      await CacheHelper.saveData<Map<String, dynamic>>(
          CacheHelperKeys.userInfo, response);
      // (await CacheHelper.getUserData());
      log("User is => ${(CacheHelper.getUserData().toJson())}");
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
