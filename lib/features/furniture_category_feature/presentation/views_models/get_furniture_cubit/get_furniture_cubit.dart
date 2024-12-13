import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/furniture_category_feature/data/repos/furniture_repo.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views_models/get_furniture_cubit/get_furniture_states.dart';

class GetFurnitureCubit extends Cubit<GetFurnitureStates> {
  GetFurnitureCubit(this.furnitureRepo) : super(GetFurnitureInitialState());
  final FurnitureRepo furnitureRepo;

  static GetFurnitureCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getFurnitureProducts({required String endPoint}) async {
    emit(GetFurnitureLoadingState());
    var result = await furnitureRepo.getFurnitureProducts(endPoint: endPoint);
    result.fold(
      (error) => emit(GetFurnitureFailedState(errorMsg: error.errorMessage)),
      (data) => emit(
        GetFurnitureSuccessState(furnitureProducts: data),
      ),
    );
  }
}
