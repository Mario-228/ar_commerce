import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/features/home_feature/data/repos/home_repo_end_points.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'home_repo.dart';

class HomeRepoImplementation extends HomeRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getProducts() async {
    try {
      var result = await ApiService(BaseUrl.products).get(
          HomeRepoEndPoints.product,
          token: CacheHelper.getUserData().token);
      List<CustomProductItemModel> productItems = [];
      for (var element in result["data"]) {
        productItems.add(CustomProductItemModel.fromJson(element));
      }
      return right(productItems);
    } catch (e) {
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
