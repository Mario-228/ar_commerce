import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/api_service/base_url.dart';
import 'package:graduation_project_new_version/features/product_details_feature/data/repos/get_ar_url_endpoint.dart';
import 'package:graduation_project_new_version/features/product_details_feature/data/repos/get_ar_url_repo.dart';

class GetArUrlRepoImplementation implements GetArUrlRepo {
  @override
  Future<Either<Errors, String>> getArUrl({required int productId}) async {
    try {
      var url = await ApiService(BaseUrl.products)
          .getARUrl(GetArUrlEndpoint.getArUrl + productId.toString());
      log(url.toString());
      return right(url);
    } catch (e) {
      log(e.toString());
      return left(
        ServerError.fromDioError(e),
      );
    }
  }
}
