import 'package:crypt/crypt.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/features/login_feature/data/repos/login_repo.dart';
import 'package:graduation_project/features/login_feature/data/repos/login_repo_constants.dart';
import 'package:graduation_project/features/signup_feature/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepoImplementations extends LoginRepo {
  @override
  Future<Either<Errors, bool>> login(
      {required String email, required String password}) async {
    try {
      var response = await Supabase.instance.client
          .from(LoginRepoConstants.usersEndPoint)
          .select()
          .eq(LoginRepoConstants.email, email)
          .eq(LoginRepoConstants.password, Crypt.sha256(password));
      UserModel? result = UserModel.fromJson(response.first);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        return right(true);
      } else {
        return right(false);
      }
    } catch (e) {
      return left(ServerError(errorMessage: e.toString()));
    }
  }
}
