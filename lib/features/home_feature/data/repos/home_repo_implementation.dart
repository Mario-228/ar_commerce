import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/api_service/api_service.dart';
import '../../../../core/utils/api_service/base_url.dart';
import '../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'home_repo.dart';

class HomeRepoImplementation extends HomeRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getProducts(
      {required String endPoint}) async {
    try {
      var result = await ApiService(BaseUrl.products).get(endPoint);
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
