import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'get_product_states.dart';

class GetProductCubit extends Cubit<GetProductStates> {
  GetProductCubit({required this.homeRepo}) : super(GetProductInitialState());
  final HomeRepo homeRepo;
  static GetProductCubit get(BuildContext context) => BlocProvider.of(context);
  bool isLoaded = false;
  Future<void> getProduct() async {
    if (isLoaded) return;
    emit(GetProductLoadingState());
    var result = await homeRepo.getProducts();
    result.fold(
        (error) =>
            emit(GetProductErrorState(errorMessageFromApi: error.errorMessage)),
        (data) {
      isLoaded = true;
      emit(GetProductSuccessState(productItems: data));
    });
  }
}
