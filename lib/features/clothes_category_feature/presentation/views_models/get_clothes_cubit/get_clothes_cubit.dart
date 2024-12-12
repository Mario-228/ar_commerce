import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/clothes_category_feature/data/repos/clothes_repo.dart';
import 'package:graduation_project/features/clothes_category_feature/presentation/views_models/get_clothes_cubit/get_clothes_states.dart';

class GetClothesCubit extends Cubit<GetClothesStates> {
  GetClothesCubit(this.clothesRepo) : super(GetClothesInitialState());
  final ClothesRepo clothesRepo;
  static GetClothesCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getClothes({required String endPoint}) async {
    emit(GetClothesLoadingState());
    var result = await clothesRepo.getClothesProducts(endPoint: endPoint);
    result.fold(
      (error) => emit(
        GetClothesFailedState(errorMsg: error.errorMessage),
      ),
      (data) => emit(
        GetClothesSuccessState(clothesProducts: data),
      ),
    );
  }
}
