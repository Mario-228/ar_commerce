import 'package:dartz/dartz.dart';
import 'package:graduation_project_new_version/core/errors/errors.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/add_to_cart_ouput_model.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';

abstract class CartRepo {
  Future<Either<Errors, AddToCartOuputModel>> addToCart(
      {required int productId, required int quantity});

  Future<Either<Errors, CartModel>> getCartItems();
  Future<Either<Errors, String>> deleteCart();
  Future<Either<Errors, void>> deleteOneItem(
      {required int productId, int quantity = 1});
}
