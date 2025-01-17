import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/features/profile_feature/data/models/update_profile_model.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_response.dart';

abstract class UpdateUserRepo {
  Future<Either<Errors, SignUpResponse>> updateUser(
      {required UpdateProfileModel model});
}
