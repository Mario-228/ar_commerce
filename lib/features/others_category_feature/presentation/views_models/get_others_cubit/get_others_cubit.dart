import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/others_category_feature/data/repos/others_repo.dart';
import 'package:graduation_project/features/others_category_feature/presentation/views_models/get_others_cubit/get_others_states.dart';

class GetOthersCubit extends Cubit<GetOthersStates> {
  GetOthersCubit(this.othersRepo) : super(GetOthersInitialState());
  final OthersRepo othersRepo;

  static GetOthersCubit get(context) => BlocProvider.of(context);

  Future<void> getOthersProducts({required String endPoint}) async {
    emit(GetOthersLoadingState());
    final result = await othersRepo.getOthersProducts(endPoint: endPoint);
    result.fold(
      (error) => emit(GetOthersFailedState(errorMsg: error.errorMessage)),
      (data) => emit(GetOthersSuccessState(productItems: data)),
    );
  }
}
