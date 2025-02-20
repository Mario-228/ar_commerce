import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../models/sign_up_user_model.dart';
// import 'package:graduation_project/features/signup_feature/data/models/user_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignUpRepo {
  Future<Either<Errors, String>> signUpUser(SignUpUserModel signUpUserModel);
  Future<Either<Errors, String>> sendVerificationEmail(String email);
}
