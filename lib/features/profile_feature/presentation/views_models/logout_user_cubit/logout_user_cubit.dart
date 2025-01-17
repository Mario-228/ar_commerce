import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/features/profile_feature/data/repos/profile_repo/profile_repo_implementation.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/logout_user_cubit/logout_user_states.dart';

class LogoutUserCubit extends Cubit<LogoutUserStates> {
  LogoutUserCubit() : super(LogoutUserInitialState());
  static LogoutUserCubit get(context) => BlocProvider.of(context);

  Future<void> logoutUser() async {
    emit(LogoutUserLoadingState());

    var response = await ProfileRepoImplementation().signOut(userToken);
    response.fold(
      (error) => emit(LogoutUserErrorState(errorMessage: error.errorMessage)),
      (value) => emit(LogoutUserSuccessState(successMessage: value)),
    );
  }
}
