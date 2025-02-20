import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/home_repo.dart';
import 'get_product_states.dart';

class GetProductCubit extends Cubit<GetProductStates> {
  GetProductCubit({required this.homeRepo}) : super(GetProductInitialState());
  final HomeRepo homeRepo;
  static GetProductCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getProduct({required String endPoint}) async {
    emit(GetProductLoadingState());
    var result = await homeRepo.getProducts(endPoint: endPoint);
    result.fold(
        (error) =>
            emit(GetProductErrorState(errorMessageFromApi: error.errorMessage)),
        (data) => emit(GetProductSuccessState(productItems: data)));
  }
}
