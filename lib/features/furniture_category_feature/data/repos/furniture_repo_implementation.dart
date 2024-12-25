import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/furniture_category_feature/data/repos/furniture_repo.dart';
// import 'package:graduation_project/features/furniture_category_feature/data/repos/furniture_repo_endpoints.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class FurnitureRepoImplementation extends FurnitureRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getFurnitureProducts(
      {required String endPoint}) async {
    try {
      var result = await ApiService(BaseUrl.products).get(endPoint);
      print(result);
      List<CustomProductItemModel> accessoriesProducts = [];
      for (var element in result["data"]) {
        accessoriesProducts.add(CustomProductItemModel.fromJson(element));
      }
      print(accessoriesProducts);
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
