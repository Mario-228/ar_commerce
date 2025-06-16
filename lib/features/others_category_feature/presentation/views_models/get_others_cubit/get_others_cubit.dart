import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/others_repo.dart';
import 'get_others_states.dart';

class GetOthersCubit extends Cubit<GetOthersStates> {
  GetOthersCubit(this.othersRepo) : super(GetOthersInitialState());
  final OthersRepo othersRepo;

  static GetOthersCubit get(context) => BlocProvider.of(context);
  bool isLoaded = false;
  Future<void> getOthersProducts({required String endPoint}) async {
    if (isLoaded) return;
    emit(GetOthersLoadingState());
    final result = await othersRepo.getOthersProducts(endPoint: endPoint);
    result.fold(
      (error) => emit(GetOthersFailedState(errorMsg: error.errorMessage)),
      (data) {
        isLoaded = true;
        emit(GetOthersSuccessState(productItems: data));
      },
    );
  }
}
