import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/features/forgot_password_feature/data/forgot_password_constants.dart';
import 'package:graduation_project/features/forgot_password_feature/data/forgot_password_repo.dart';

class ForgotPasswordRepoImplementation extends ForgotPasswordRepo {
  @override
  Future<Either<Errors, String>> forgotPassword(String email) async {
    try {
      var response = await ApiService(BaseUrl.authentication)
          .postData(ForgotPasswordConstants.forgetPassword, {"email": email});
      return right(response['data']);
    } on Exception catch (e) {
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
