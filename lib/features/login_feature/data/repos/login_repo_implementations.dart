// import 'package:crypt/crypt.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/features/login_feature/data/repos/login_repo.dart';
import 'package:graduation_project/features/login_feature/data/repos/login_repo_constants.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_response.dart';
// import 'package:graduation_project/features/login_feature/data/repos/login_repo_constants.dart';
// import 'package:graduation_project/features/signup_feature/data/models/sign_up_user_model.dart';
// import 'package:graduation_project/features/signup_feature/data/models/user_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepoImplementations extends LoginRepo {
  static String token = "";
  @override
  Future<Either<Errors, SignUpResponse>> login(
      {required String email, required String password}) async {
    try {
      var response = await ApiService(BaseUrl.authentication).postData(
          LoginRepoConstants.login, {"email": email, "password": password});
      SignUpResponse result = SignUpResponse.fromJson(response);
      token = result.token;
      print(result.name);
      print(result.token);
      return right(result);
    } catch (e) {
      print(e);
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
