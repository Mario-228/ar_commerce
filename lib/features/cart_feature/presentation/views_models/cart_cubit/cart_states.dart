import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {
  final CartModel cartModel;

  GetCartSuccessState({required this.cartModel});
}

class GetCartErrorState extends CartStates {
  final String errorMessage;

  GetCartErrorState({required this.errorMessage});
}

class DeleteCartLoadingState extends CartStates {}

class DeleteCartErrorState extends CartStates {
  final String errorMessage;

  DeleteCartErrorState({required this.errorMessage});
}

class AddProductToCartLoadingState extends CartStates {}

class AddProductToCartErrorState extends CartStates {
  final String errorMessage;

  AddProductToCartErrorState({required this.errorMessage});
}
