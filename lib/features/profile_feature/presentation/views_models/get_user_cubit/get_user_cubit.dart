import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import '../../../data/repos/profile_repo/profile_repo_implementation.dart';
import 'get_user_states.dart';

class GetUserCubit extends Cubit<GetUserStates> {
  GetUserCubit() : super(GetUserInitialState());
  static GetUserCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> getUser() async {
    emit(GetUserLoadingState());
    var result = await ProfileRepoImplementation()
        .getUserProfile(CacheHelper.getUserData().token); //temp token
    result.fold(
      (error) => emit(GetUserErrorState(errorMessage: error.errorMessage)),
      (data) => emit(GetUserSuccessState(userModel: data)),
    );
  }
}
