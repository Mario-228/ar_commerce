import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/errors/errors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/home_feature/data/repos/home_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepoImplementation extends HomeRepo {
  @override
  Future<Either<Errors, List<CustomProductItemModel>>> getProducts(
      {required String endPoint}) async {
    try {
      var result = await Supabase.instance.client.from(endPoint).select();
      List<CustomProductItemModel> productItems = [];
      for (var element in result) {
        productItems.add(CustomProductItemModel.fromJson(element));
      }
      return right(productItems);
    } catch (e) {
      return left(
        ServerError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
