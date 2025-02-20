import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import 'email_verification_constants.dart';
import 'email_verification_repo.dart';

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
