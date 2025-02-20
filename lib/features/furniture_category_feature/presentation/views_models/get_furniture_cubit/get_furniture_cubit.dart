import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/furniture_repo.dart';
import 'get_furniture_states.dart';

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
