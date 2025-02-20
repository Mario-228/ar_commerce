import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';

abstract class FurnitureRepo {
  Future<Either<Errors, List<CustomProductItemModel>>> getFurnitureProducts(
      {required String endPoint});
}
