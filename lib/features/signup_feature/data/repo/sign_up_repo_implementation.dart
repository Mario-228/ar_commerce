import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_user_model.dart';
import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpRepoImplementation extends SignUpRepo {
  @override
  Future<Either<Errors, AuthResponse>> signUpUser(
      SignUpUserModel signUpUserModel) async {
    try {
      var response = await Supabase.instance.client.auth.signUp(data: {
        'name': signUpUserModel.name,
      }, email: signUpUserModel.email, password: signUpUserModel.password);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(errorMessage: e.toString()));
      }
    }
  }
}
