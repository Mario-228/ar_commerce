import 'package:dartz/dartz.dart';
import '../../../core/errors/errors.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Errors, String>> forgotPassword(String email);
}
