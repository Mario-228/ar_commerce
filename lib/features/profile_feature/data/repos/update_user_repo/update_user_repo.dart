import 'dart:async';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/errors.dart';
import '../../models/update_profile_model.dart';
import '../../models/update_profile_response_model.dart';

abstract class UpdateUserRepo {
  Future<Either<Errors, UpdateProfileResponseModel>> updateUser(
      {required UpdateProfileModel model});
}
