import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';

abstract class AccessoriesRepo {
  Future<Either<Errors, List<CustomProductItemModel>>> getAccessoriesProducts(
      {required String endPoint});
}
