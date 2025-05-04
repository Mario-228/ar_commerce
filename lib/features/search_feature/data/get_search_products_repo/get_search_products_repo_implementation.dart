import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/api_service/base_url.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project_new_version/features/search_feature/data/get_search_products_repo/get_search_products_endpoints.dart';
import 'package:graduation_project_new_version/features/search_feature/data/get_search_products_repo/get_search_products_repo.dart';

import '../../../../core/errors/errors.dart';

class GetSearchProductsRepoImplementation implements GetSearchProductsRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getSearchProducts(
      String searchText) async {
    try {
      var response = await ApiService(BaseUrl.products).getWithTokenAndQuery(
          GetSearchProductsEndpoints.getSearchProducts,
          CacheHelper.getUserData().token,
          {"SearchByName": searchText});
      List<CustomProductItemModel> result = [];

      for (var item in response['data']) {
        result.add(CustomProductItemModel.fromJson(item));
      }
      log(result.toString());
      return right(result);
    } catch (e) {
      log(e.toString());
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
