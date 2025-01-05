import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/features/profile_feature/data/repos/profile_constants.dart';
import 'package:graduation_project/features/profile_feature/data/repos/profile_repo.dart';

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
}
