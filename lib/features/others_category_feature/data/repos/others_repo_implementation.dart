import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/others_category_feature/data/repos/others_repo.dart';
import 'package:graduation_project/features/others_category_feature/data/repos/others_repo_endpoints.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OthersRepoImplementation extends OthersRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getOthersProducts(
      {required String endPoint}) async {
    try {
      var result = await Supabase.instance.client
          .from(endPoint)
          .select()
          .not(OthersRepoEndpoints.id, "containedBy", [1, 2, 3]);
      List<CustomProductItemModel> othersProducts = [];
      for (var element in result) {
        othersProducts.add(CustomProductItemModel.fromJson(element));
      }
      return right(othersProducts);
    } catch (e) {
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
