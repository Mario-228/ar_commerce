import 'package:dartz/dartz.dart';
import '../../../core/errors/errors.dart';

abstract class ResetPasswordRepo {
  Future<Either<Errors, String>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });
}
