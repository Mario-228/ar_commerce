import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import '../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../../core/utils/cache_helper/cache_helper_keys.dart';
import '../../../signup_feature/data/models/sign_up_response.dart';
import 'login_repo.dart';
import 'login_repo_constants.dart';

class LoginRepoImplementations extends LoginRepo {
  static String token = "";
  @override
  Future<Either<Errors, SignUpResponse>> login(
      {required String email, required String password}) async {
    try {
      var response = await ApiService(BaseUrl.authentication).postData(
          LoginRepoConstants.login, {"email": email, "password": password});
      if (response.containsKey('error')) {
        return left(ServerError(errorMessage: response['error']));
      }
      SignUpResponse result = SignUpResponse.fromJson(response);
      token = result.token;
      await CacheHelper.saveData<String>(CacheHelperKeys.tokenKey, token);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
