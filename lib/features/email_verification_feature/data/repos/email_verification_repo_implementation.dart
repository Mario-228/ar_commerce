import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/features/email_verification_feature/data/repos/email_verification_constants.dart';
import 'package:graduation_project/features/email_verification_feature/data/repos/email_verification_repo.dart';

class EmailVerificationRepoImplementation extends EmailVerificationRepo {
  @override
  Future<Either<Errors, String>> emailVerification(
      String email, String otp) async {
    try {
      var response = await ApiService(BaseUrl.authentication).postData(
          EmailVerificationConstants.emailVerification,
          {"email": email, "otp": otp});
      return right(response['data']);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(errorMessage: e.toString()));
      }
    }
  }
}
