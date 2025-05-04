import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'others_repo.dart';

class OthersRepoImplementation extends OthersRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getOthersProducts(
      {required String endPoint}) async {
    try {
      var result = await ApiService(BaseUrl.products)
          .get(endPoint, token: CacheHelper.getUserData().token);
      List<CustomProductItemModel> othersProducts = [];
      for (var element in result['data']) {
        othersProducts.add(CustomProductItemModel.fromJson(element));
      }
      return right(othersProducts);
    } catch (e) {
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
