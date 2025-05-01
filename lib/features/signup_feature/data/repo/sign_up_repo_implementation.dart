import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import '../models/sign_up_user_model.dart';
import 'sign_up_repo.dart';
import 'sign_up_repo_constants.dart';

class SignUpRepoImplementation extends SignUpRepo {
  @override
  Future<Either<Errors, String>> signUpUser(
      SignUpInputModel signUpUserModel) async {
    try {
      var response = await ApiService(BaseUrl.authentication).postWithImage(
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
      String message = "";
      message = response['user'] ?? response['data'];
      return right(message);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(errorMessage: e.toString()));
      }
    }
  }
}
