import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/repos/cart_repo_implementation.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views_models/cart_cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getCart() async {
    emit(GetCartLoadingState());
    var response = await CartRepoImplementation().getCartItems();
    response.fold(
      (onError) => emit(GetCartErrorState(errorMessage: onError.errorMessage)),
      (onSuccess) => emit(GetCartSuccessState(cartModel: onSuccess)),
    );
  }

  Future<void> deleteCart() async {
    emit(DeleteCartLoadingState());
    var response = await CartRepoImplementation().deleteCart();
    response.fold(
        (onError) =>
            emit(DeleteCartErrorState(errorMessage: onError.errorMessage)),
        (onSuccess) async => await getCart());
  }

  Future<void> addProductToCart(
      {required int productId, required int quantity}) async {
    emit(AddProductToCartLoadingState());
    var response = await CartRepoImplementation()
        .addToCart(productId: productId, quantity: quantity);
    response.fold((onError) {
      emit(AddProductToCartErrorState(errorMessage: onError.errorMessage));
      log(onError.errorMessage);
    }, (onSuccess) async => await getCart());
  }
}
