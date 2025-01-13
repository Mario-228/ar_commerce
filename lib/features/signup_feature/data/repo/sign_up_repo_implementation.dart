import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_user_model.dart';
import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo.dart';
import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo_constants.dart';

class SignUpRepoImplementation extends SignUpRepo {
  @override
  Future<Either<Errors, String>> signUpUser(
      SignUpUserModel signUpUserModel) async {
    try {
      var response = await ApiService(BaseUrl.authentication).postData(
          SignUpRepoConstants.registerEndPoint, signUpUserModel.toJson());
      return right(response['data']);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Errors, String>> sendVerificationEmail(String email) async {
    try {
      var response = await ApiService(BaseUrl.authentication).postData(
          SignUpRepoConstants.sendEmailVerificationEndPoint, {"email": email});
      return right(response['data']);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(errorMessage: e.toString()));
      }
    }
  }

  // @override
  // Future<Either<Errors, SignUpUserModel>> insertUserIntoDatabase(
  //     SignUpUserModel userModel) async {
  //   try {
  //     var response = await Supabase.instance.client
  //         .from(SignUpRepoConstants.usersEndPoint)
  //         .insert(userModel.toJson())
  //         .select();
  //     return right(UserModel.fromJson(response.first));
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return left(ServerError.fromDioError(e));
  //     } else {
  //       return left(ServerError(errorMessage: e.toString()));
  //     }
  //   }
  // }
}
