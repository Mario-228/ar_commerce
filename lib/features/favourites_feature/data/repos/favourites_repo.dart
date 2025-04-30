import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../core/errors/errors.dart';

abstract class FavouritesRepo {
  Future<Either<Errors, List<CustomProductItemModel>>> getUserFavourites();

  Future<Either<Errors, CustomProductItemModel>> removeOrAddFavourite({
    required int productId,
  });
}
