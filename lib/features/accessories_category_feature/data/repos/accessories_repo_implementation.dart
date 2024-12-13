import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/accessories_category_feature/data/repos/accessories_repo.dart';
import 'package:graduation_project/features/accessories_category_feature/data/repos/accessories_repo_endpoints.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccessoriesRepoImplementation extends AccessoriesRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getAccessoriesProducts(
      {required String endPoint}) async {
    try {
      var result = await Supabase.instance.client
          .from(endPoint)
          .select()
          .eq(AccessoriesRepoEndpoints.id, 3);
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
