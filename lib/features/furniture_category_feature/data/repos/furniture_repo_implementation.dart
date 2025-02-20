import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import '../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'furniture_repo.dart';
// import 'package:graduation_project/features/furniture_category_feature/data/repos/furniture_repo_endpoints.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class FurnitureRepoImplementation extends FurnitureRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getFurnitureProducts(
      {required String endPoint}) async {
    try {
      var result = await ApiService(BaseUrl.products).get(endPoint);
      List<CustomProductItemModel> accessoriesProducts = [];
      for (var element in result["data"]) {
        accessoriesProducts.add(CustomProductItemModel.fromJson(element));
      }

      return right(accessoriesProducts);
    } catch (e) {
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
