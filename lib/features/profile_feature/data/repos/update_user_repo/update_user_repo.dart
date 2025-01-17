import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/features/profile_feature/data/models/update_profile_model.dart';
import 'package:graduation_project/features/profile_feature/data/models/update_profile_response_model.dart';

abstract class UpdateUserRepo {
  Future<Either<Errors, UpdateProfileResponseModel>> updateUser(
      {required UpdateProfileModel model});
}
