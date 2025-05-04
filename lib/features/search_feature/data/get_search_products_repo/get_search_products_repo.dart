import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';

abstract class GetSearchProductsRepo {
  Future<Either<Errors, List<CustomProductItemModel>>> getSearchProducts(
      String searchText);
}
