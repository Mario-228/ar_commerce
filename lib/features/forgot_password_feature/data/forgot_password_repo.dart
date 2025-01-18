import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Errors, String>> forgotPassword(String email);
}
