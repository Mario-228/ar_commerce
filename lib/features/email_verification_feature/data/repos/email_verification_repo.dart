import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';

abstract class EmailVerificationRepo {
  Future<Either<Errors, String>> emailVerification(String email, String otp);
}
