import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'accessories_repo.dart';

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
