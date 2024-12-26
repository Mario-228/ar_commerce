import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/accessories_category_feature/data/repos/accessories_repo.dart';

class AccessoriesRepoImplementation extends AccessoriesRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getAccessoriesProducts(
      {required String endPoint}) async {
    try {
      var result = await ApiService(BaseUrl.products).get(endPoint);
      List<CustomProductItemModel> accessoriesProducts = [];
      for (var element in result['data']) {
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
