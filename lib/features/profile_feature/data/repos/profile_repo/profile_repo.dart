import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';

abstract class ProfileRepo {
  Future<Either<Errors, String>> signOut(String token);
  Future<Either<Errors, UserModel>> getUserProfile(String token);
}
