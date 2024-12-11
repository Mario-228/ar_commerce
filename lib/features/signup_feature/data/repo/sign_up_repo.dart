import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_user_model.dart';
import 'package:graduation_project/features/signup_feature/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignUpRepo {
  Future<Either<Errors, AuthResponse>> signUpUser(
      SignUpUserModel signUpUserModel);
  Future<Either<Errors, UserModel>> insertUserIntoDatabase(UserModel userModel);
}
