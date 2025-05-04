import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'clothes_repo.dart';

class ClothesRepoImplementation extends ClothesRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getClothesProducts(
      {required String endPoint}) async {
    try {
      var result = await ApiService(BaseUrl.products)
          .get(endPoint, token: CacheHelper.getUserData().token);
      List<CustomProductItemModel> clothesProducts = [];
      for (var element in result['data']) {
        clothesProducts.add(CustomProductItemModel.fromJson(element));
      }

      return right(clothesProducts);
    } catch (e) {
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
