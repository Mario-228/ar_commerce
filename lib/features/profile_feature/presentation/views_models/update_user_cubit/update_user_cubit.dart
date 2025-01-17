import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/profile_feature/data/models/update_profile_model.dart';
import 'package:graduation_project/features/profile_feature/data/repos/update_user_repo/update_user_repo_implementation.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/update_user_cubit/update_user_states.dart';

class UpdateUserCubit extends Cubit<UpdateUserStates> {
  UpdateUserCubit() : super(UpdateUserInitialState());
  static UpdateUserCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> updateUser(UpdateProfileModel model) async {
    emit(UpdateUserLoadingState());
    var response =
        await UpdateUserRepoImplementation().updateUser(model: model);
    response.fold(
      (error) => emit(UpdateUserErrorState(errorMessage: error.errorMessage)),
      (value) => emit(UpdateUserSuccessState(userModel: value)),
    );
  }
}
