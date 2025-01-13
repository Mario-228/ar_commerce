import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';

abstract class EmailVerificationRepo {
  Future<Either<Errors, String>> emailVerification(String email, String otp);
}
