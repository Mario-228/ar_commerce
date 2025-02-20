import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../constants.dart';
import '../../../../../core/errors/errors.dart';
import '../../../../../core/utils/api_service/api_service.dart';
import '../../../../../core/utils/api_service/base_url.dart';
import '../../models/update_profile_model.dart';
import '../../models/update_profile_response_model.dart';
import 'update_user_constants.dart';
import 'update_user_repo.dart';

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
