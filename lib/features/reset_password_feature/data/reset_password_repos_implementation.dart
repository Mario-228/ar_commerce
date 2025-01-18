import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/features/reset_password_feature/data/reset_password_constants.dart';
import 'package:graduation_project/features/reset_password_feature/data/reset_password_repos.dart';

class ResetPasswordReposImplementation extends ResetPasswordRepo {
  @override
  Future<Either<Errors, String>> resetPassword(
      {required String email,
      required String otp,
      required String newPassword}) async {
    try {
      var response = await ApiService(BaseUrl.authentication)
          .postData(ResetPasswordConstants.resetPassword, {
        ResetPasswordConstants.email: email,
        ResetPasswordConstants.otp: otp,
        ResetPasswordConstants.password: newPassword,
        ResetPasswordConstants.passwordConfirmation: newPassword
      });
      return right(response['data']);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
