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
}
