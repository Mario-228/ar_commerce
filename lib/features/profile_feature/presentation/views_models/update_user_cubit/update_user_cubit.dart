import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/update_user_cubit/update_user_states.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../data/models/profile_user_model.dart';
import '../../../data/models/update_profile_model.dart';
import '../../../data/repos/profile_repo/profile_repo_implementation.dart';
import '../../../data/repos/update_user_repo/update_user_repo_implementation.dart';

class UpdateUserCubit extends Cubit<UpdateUserStates> {
  UpdateUserCubit() : super(UpdateUserInitialState());
  static UpdateUserCubit get(BuildContext context) => BlocProvider.of(context);
  UserModel userModelCubit = userModel;
  UpdateProfileModel userProfileModel = UpdateProfileModel(
      name: userModel.userModel.name,
      phone: userModel.userModel.phone,
      image: File(''),
      gender: userModel.userModel.gender);
  Future<void> updateUser() async {
    userProfileModel.image = await CacheHelper.getUserImage();
    // userProfileModel.gender = userModelCubit.userModel.gender;
    // userProfileModel.name = userModelCubit.userModel.name;
    // userProfileModel.phone = userModelCubit.userModel.phone;
    // userProfileModel.image = File('');
    emit(UpdateUserLoadingState());
    var response = await UpdateUserRepoImplementation()
        .updateUser(model: userProfileModel);

    response.fold(
      (error) => emit(UpdateUserErrorState(errorMessage: error.errorMessage)),
      (value) async {
        var response =
            await ProfileRepoImplementation().getUserProfile(userToken);
        response.fold(
          (getUserError) =>
              GetUserErrorState(errorMessage: getUserError.errorMessage),
          (getUserData) {
            userModelCubit = getUserData;
            emit(UpdateUserSuccessState(userModel: getUserData));
          },
        );
      },
    );
  }
}
