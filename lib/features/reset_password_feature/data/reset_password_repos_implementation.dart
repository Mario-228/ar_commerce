import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/errors.dart';
import '../../../core/utils/api_service/api_service.dart';
import '../../../core/utils/api_service/base_url.dart';
import 'reset_password_constants.dart';
import 'reset_password_repos.dart';

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
