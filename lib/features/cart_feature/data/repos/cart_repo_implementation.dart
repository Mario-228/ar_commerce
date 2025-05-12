import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/core/utils/api_service/api_service.dart';
import 'package:graduation_project_new_version/core/utils/api_service/base_url.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/add_to_cart_ouput_model.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/repos/cart_repo.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/repos/cart_repo_endpoint.dart';

class CartRepoImplementation implements CartRepo {
  @override
  Future<Either<Errors, AddToCartOuputModel>> addToCart(
      {required int productId, required int quantity}) async {
    try {
      var response = await ApiService(BaseUrl.authentication)
          .postDataWithTokenAndQuery(
              endPoint: CartRepoEndpoint.addToCart + productId.toString(),
              token: CacheHelper.getUserData().token,
              data: {"quantity": quantity});
      return right(AddToCartOuputModel.fromJson(response));
    } on Exception catch (e) {
      return left(ServerError.fromDioError(e));
    }
  }

  @override
  Future<Either<Errors, CartModel>> getCartItems() async {
    try {
      var response = await ApiService(BaseUrl.authentication).getWithToken(
        CartRepoEndpoint.getCart,
        CacheHelper.getUserData().token,
      );
      return right(CartModel.fromJson(response));
    } on Exception catch (e) {
      return left(ServerError.fromDioError(e));
    }
  }

  @override
  Future<Either<Errors, String>> deleteCart() async {
    try {
      await ApiService(BaseUrl.authentication).deleteWithToken(
        CartRepoEndpoint.deleteCart,
      );
      return right("Cart Deleted Successfully");
    } catch (e) {
      return left(ServerError.fromDioError(e));
    }
  }

  @override
  Future<Either<Errors, void>> deleteItemWithQuantity(
      {required int productId, int quantity = 1}) async {
    try {
      // var response =
      await ApiService(BaseUrl.authentication).postDataWithTokenAndQuery(
          endPoint: CartRepoEndpoint.deleteOneItem + productId.toString(),
          token: CacheHelper.getUserData().token,
          data: {"quantity": quantity});
      return right(null); //right(CartItem.fromJson(response['message']));
    } on Exception catch (e) {
      return left(ServerError.fromDioError(e));
    }
  }
}
