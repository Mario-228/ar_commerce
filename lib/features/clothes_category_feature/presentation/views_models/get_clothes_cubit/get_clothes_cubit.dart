import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/clothes_repo.dart';
import 'get_clothes_states.dart';

class GetClothesCubit extends Cubit<GetClothesStates> {
  GetClothesCubit(this.clothesRepo) : super(GetClothesInitialState());
  final ClothesRepo clothesRepo;
  static GetClothesCubit get(BuildContext context) => BlocProvider.of(context);
  bool isLoaded = false;
  Future<void> getClothes({required String endPoint}) async {
    if (isLoaded) return;
    emit(GetClothesLoadingState());
    var result = await clothesRepo.getClothesProducts(endPoint: endPoint);
    result.fold(
      (error) => emit(GetClothesFailedState(errorMsg: error.errorMessage)),
      (data) {
        isLoaded = true;
        emit(GetClothesSuccessState(clothesProducts: data));
      },
    );
  }
}
