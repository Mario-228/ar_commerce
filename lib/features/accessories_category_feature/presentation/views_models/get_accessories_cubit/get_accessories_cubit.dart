import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/accessories_category_feature/data/repos/accessories_repo.dart';
import 'package:graduation_project/features/accessories_category_feature/presentation/views_models/get_accessories_cubit/get_accessories_states.dart';

class GetAccessoriesCubit extends Cubit<GetAccessoriesStates> {
  GetAccessoriesCubit(this.accessoriesRepo)
      : super(GetAccessoriesInitialState());
  final AccessoriesRepo accessoriesRepo;
  static GetAccessoriesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getAccessories({required String endPoint}) async {
    emit(GetAccessoriesLoadingState());
    var result =
        await accessoriesRepo.getAccessoriesProducts(endPoint: endPoint);
    result.fold(
      (error) => emit(
        GetAccessoriesFailedState(errorMsg: error.errorMessage),
      ),
      (data) => emit(
        GetAccessoriesSuccessState(accessoriesProducts: data),
      ),
    );
  }
}
