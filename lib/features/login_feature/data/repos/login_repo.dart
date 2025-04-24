import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/features/login_feature/data/models/login_output_model.dart';
import '../../../../core/errors/errors.dart';

abstract class LoginRepo {
  Future<Either<Errors, LoginOutputModel>> login(
      {required String email, required String password});
}
