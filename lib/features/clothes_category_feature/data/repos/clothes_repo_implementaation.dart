import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/clothes_category_feature/data/repos/clothes_repo.dart';
import 'package:graduation_project/features/clothes_category_feature/data/repos/clothes_repo_endpoints.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClothesRepoImplementaation extends ClothesRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getClothesProducts(
      {required String endPoint}) async {
    try {
      var result = await Supabase.instance.client
          .from(endPoint)
          .select()
          .eq(ClothesRepoEndpoints.id, '2');
      List<CustomProductItemModel> clothesProducts = [];
      for (var element in result) {
        clothesProducts.add(CustomProductItemModel.fromJson(element));
      }

      return right(clothesProducts);
    } catch (e) {
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
