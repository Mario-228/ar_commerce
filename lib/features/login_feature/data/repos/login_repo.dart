import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../../../signup_feature/data/models/sign_up_response.dart';

abstract class LoginRepo {
  Future<Either<Errors, SignUpResponse>> login(
      {required String email, required String password});
}
