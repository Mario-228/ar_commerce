import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/accessories_repo.dart';
import 'get_accessories_states.dart';

class GetAccessoriesCubit extends Cubit<GetAccessoriesStates> {
  GetAccessoriesCubit(this.accessoriesRepo)
      : super(GetAccessoriesInitialState());
  final AccessoriesRepo accessoriesRepo;
  static GetAccessoriesCubit get(BuildContext context) =>
      BlocProvider.of(context);
  bool isLoaded = false;
  Future<void> getAccessories({required String endPoint}) async {
    if (isLoaded) return;
    emit(GetAccessoriesLoadingState());
    var result =
        await accessoriesRepo.getAccessoriesProducts(endPoint: endPoint);
    result.fold(
      (error) => emit(GetAccessoriesFailedState(errorMsg: error.errorMessage)),
      (data) {
        isLoaded = true;
        emit(GetAccessoriesSuccessState(accessoriesProducts: data));
      },
    );
  }
}
