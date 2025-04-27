import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';

abstract class AccessoriesRepo {
  Future<Either<Errors, List<CustomProductItemModel>>> getAccessoriesProducts(
      {required String endPoint});
}
