import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';
import 'package:graduation_project/features/profile_feature/data/models/update_profile_model.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/update_user_cubit/update_user_cubit.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/update_user_cubit/update_user_states.dart';

class UpdateUserInfoButtonBlocBuilder extends StatelessWidget {
  const UpdateUserInfoButtonBlocBuilder({
    super.key,
    required this.myDetailsFormKey,
    required this.profileModel,
  });
  final GlobalKey<FormState> myDetailsFormKey;
  final Future<UpdateProfileModel> profileModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUserCubit(),
      child: BlocConsumer<UpdateUserCubit, UpdateUserStates>(
          listener: (context, state) {
        if (state is UpdateUserSuccessState) {
          showSnackBar(context, "Updated successfully");
        } else if (state is UpdateUserErrorState) {
          showSnackBar(context, state.errorMessage);
        }
      }, builder: (context, state) {
        if (state is UpdateUserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.lightLimeGreen),
          );
        } else {
          return CustomMaterialButton(
            text: "Update",
            color: AppColors.darkGreen,
            onPressed: () async {
              handleUpdatingUserDataFromApi(context);
            },
          );
        }
      }),
    );
  }

  void handleUpdatingUserDataFromApi(BuildContext context) {
    profileModel.then((value) {
      if (value.gender.isEmpty) {
        showSnackBar(context, "Select your gender");
        return;
      }
      if (myDetailsFormKey.currentState!.validate()) {
        UpdateUserCubit.get(context).updateUser(value);
      }
    });
  }
}
