import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home_feature/data/repos/home_repo.dart';
import 'package:graduation_project/features/home_feature/presentation/views_models/get_product_cubit/get_product_states.dart';

class GetProductCubit extends Cubit<GetProductStates> {
  GetProductCubit({required this.homeRepo}) : super(GetProductInitialState());
  final HomeRepo homeRepo;
  static GetProductCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getProduct() async {
    emit(GetProductLoadingState());
    var result = await homeRepo.getProducts();
    result.fold(
        (error) =>
            emit(GetProductErrorState(errorMessageFromApi: error.errorMessage)),
        (data) => emit(GetProductSuccessState(productItems: data)));
  }
}
