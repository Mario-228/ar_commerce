import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/features/profile_feature/data/repos/profile_repo/profile_repo_implementation.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/get_user_cubit/get_user_states.dart';

class GetUserCubit extends Cubit<GetUserStates> {
  GetUserCubit() : super(GetUserInitialState());
  static GetUserCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> getUser() async {
    emit(GetUserLoadingState());
    var result = await ProfileRepoImplementation()
        .getUserProfile(userToken); //temp token
    result.fold(
      (error) => emit(GetUserErrorState(errorMessage: error.errorMessage)),
      (data) => emit(GetUserSuccessState(userModel: data)),
    );
  }
}
