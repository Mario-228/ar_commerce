import 'package:dartz/dartz.dart';
import '../../../../../core/errors/errors.dart';
import '../../models/profile_user_model.dart';

abstract class ProfileRepo {
  Future<Either<Errors, String>> signOut(String token);
  Future<Either<Errors, UserModel>> getUserProfile(String token);
}
