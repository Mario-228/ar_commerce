import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';

abstract class LoginRepo {
  Future<Either<Errors, bool>> login(
      {required String email, required String password});
}
