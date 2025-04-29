import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project_new_version/features/favourites_feature/data/repos/favourites_repo.dart';
import 'package:graduation_project_new_version/features/favourites_feature/data/repos/favourites_repo_endpoints.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';

class FavouritesRepoImplementation implements FavouritesRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>>
      getUserFavourites() async {
    try {
      var result = await ApiService(BaseUrl.products).getFavourites(
          FavouritesRepoEndPoints.favourites,
          token: CacheHelper.getUserData().token);
      log(result.toString());
      List<CustomProductItemModel> favouriteItems = [];

      for (var element in result) {
        favouriteItems.add(
          CustomProductItemModel.fromJson(element),
        );
      }
      log(favouriteItems.toString());

      return right(favouriteItems);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerError.fromDioError(e),
        );
      }
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Errors, CustomProductItemModel>> removeOrAddFavourite(
      {required int productId}) async {
    try {
      var result = await ApiService(BaseUrl.products).signOut(
          FavouritesRepoEndPoints.removeOrAddFavourite + productId.toString(),
          CacheHelper.getUserData().token);
      CustomProductItemModel product =
          CustomProductItemModel.fromJson(result['product']);
      log(product.toString());
      return right(product);
    } catch (e) {
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
