import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/api_service/api_service.dart';
import 'package:graduation_project/core/utils/api_service/base_url.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/others_category_feature/data/repos/others_repo.dart';

class OthersRepoImplementation extends OthersRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getOthersProducts(
      {required String endPoint}) async {
    try {
      var result = await ApiService(BaseUrl.products).get(endPoint);
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
