import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/errors/errors.dart';
import '../../../../../core/utils/api_service/api_service.dart';
import '../../../../../core/utils/api_service/base_url.dart';
import '../../models/profile_user_model.dart';
import 'profile_constants.dart';
import 'profile_repo.dart';

class ProfileRepoImplementation extends ProfileRepo {
  @override
  Future<Either<Errors, String>> signOut(String token) async {
    try {
      var result = await ApiService(BaseUrl.authentication)
          .signOut(ProfileConstants.signOut, token);
      return Right(result['message']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      }
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Errors, UserModel>> getUserProfile(String token) async {
    try {
      print("Token is => $token");
      var result = await ApiService(BaseUrl.authentication)
          .getWithToken(ProfileConstants.profile, token);
      return Right(UserModel.fromJson(result));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      }
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
