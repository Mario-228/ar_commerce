import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_response.dart';

abstract class LoginRepo {
  Future<Either<Errors, SignUpResponse>> login(
      {required String email, required String password});
}
