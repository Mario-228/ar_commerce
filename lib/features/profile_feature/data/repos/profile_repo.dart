import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';

abstract class ProfileRepo {
  Future<Either<Errors, String>> signOut(String token);
}
