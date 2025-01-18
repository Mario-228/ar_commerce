import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';

abstract class ResetPasswordRepo {
  Future<Either<Errors, String>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });
}
