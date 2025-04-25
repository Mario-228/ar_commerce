import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper_keys.dart';
import 'package:graduation_project_new_version/features/login_feature/data/models/login_output_model.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/update_user_cubit/update_user_states.dart';
import '../../../../../constants.dart';
import '../../../data/models/profile_user_model.dart';
import '../../../data/models/update_profile_model.dart';
import '../../../data/repos/profile_repo/profile_repo_implementation.dart';
import '../../../data/repos/update_user_repo/update_user_repo_implementation.dart';

class UpdateUserCubit extends Cubit<UpdateUserStates> {
  UpdateUserCubit() : super(UpdateUserInitialState());
  static UpdateUserCubit get(BuildContext context) => BlocProvider.of(context);
  final TextEditingController nameController =
      TextEditingController(text: userModel.userModel.name);
  final TextEditingController phoneController =
      TextEditingController(text: userModel.userModel.phone);
  final GlobalKey<FormState> myDetailsFormKey = GlobalKey<FormState>();
  UserModel userModelCubit = userModel;
  File? image;
  Future<void> updateUser() async {
    emit(UpdateUserLoadingState());
    UpdateProfileModel userProfileModel = UpdateProfileModel(
      name: nameController.text,
      phone: phoneController.text,
      image: image,
    );
    var response = await UpdateUserRepoImplementation()
        .updateUser(model: userProfileModel);

    response.fold(
      (error) => emit(UpdateUserErrorState(errorMessage: error.errorMessage)),
      (value) async {
        var response = await ProfileRepoImplementation()
            .getUserProfile(CacheHelper.getUserData().token);
        response.fold(
          (getUserError) =>
              GetUserErrorState(errorMessage: getUserError.errorMessage),
          (getUserData) async {
            //for using data in the provided area of update user cubit
            userModelCubit = getUserData;
            //for saving user data in hive
            LoginOutputModel userSavedModel = CacheHelper.getUserData();
            userSavedModel.user = getUserData.userModel;
            //////////////////////////////////////////////
            await CacheHelper.saveData<Map<String, dynamic>>(
                CacheHelperKeys.userInfo, userSavedModel.toJson());
            emit(UpdateUserSuccessState(userModel: getUserData));
          },
        );
      },
    );
  }
}
