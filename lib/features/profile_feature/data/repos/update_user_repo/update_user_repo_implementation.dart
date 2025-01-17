import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/features/profile_feature/data/models/update_profile_model.dart';
import 'package:graduation_project/features/profile_feature/data/models/update_profile_response_model.dart';
import 'package:graduation_project/features/profile_feature/data/repos/update_user_repo/update_user_constants.dart';
import 'package:graduation_project/features/profile_feature/data/repos/update_user_repo/update_user_repo.dart';

class UpdateUserRepoImplementation extends UpdateUserRepo {
  @override
  Future<Either<Errors, UpdateProfileResponseModel>> updateUser(
      {required UpdateProfileModel model}) async {
    try {
      print(model.toJson());
      var response = await ApiService(BaseUrl.authentication).postWithToken(
          UpdateUserConstants.updateUserEndPoint, userToken, model.toJson());
      return right(UpdateProfileResponseModel.fromJson(response));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(errorMessage: e.toString()));
      }
    }
  }
}
