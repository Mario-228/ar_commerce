import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';

abstract class HomeRepo {
  Future<Either<Errors, List<CustomProductItemModel>>> getProducts(
      {required String endPoint});
}
