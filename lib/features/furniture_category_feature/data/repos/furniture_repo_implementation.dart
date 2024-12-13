import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/furniture_category_feature/data/repos/furniture_repo.dart';
import 'package:graduation_project/features/furniture_category_feature/data/repos/furniture_repo_endpoints.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FurnitureRepoImplementation extends FurnitureRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getFurnitureProducts(
      {required String endPoint}) async {
    try {
      var result = await Supabase.instance.client
          .from(endPoint)
          .select()
          .eq(FurnitureRepoEndpoints.id, 1);
      List<CustomProductItemModel> accessoriesProducts = [];
      for (var element in result) {
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
