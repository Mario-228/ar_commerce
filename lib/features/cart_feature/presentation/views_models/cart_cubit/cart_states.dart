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
