import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/constants.dart';
// import 'package:graduation_project/core/utils/functions/get_user_update_information.dart';
// import 'package:graduation_project/features/profile_feature/presentation/views/widgets/my_details_view/widgets/custom_gender_selection_widget.dart';
import '../../../../../../../constants.dart';
import '../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../../../core/widgets/custom_material_button.dart';
import '../../../../views_models/update_user_cubit/update_user_cubit.dart';
import '../../../../views_models/update_user_cubit/update_user_states.dart';
import 'my_details_input_fields_section.dart';

class UpdateUserInfoButtonBlocBuilder extends StatelessWidget {
  const UpdateUserInfoButtonBlocBuilder({
    super.key,
    required this.myDetailsFormKey,
  });
  final GlobalKey<FormState> myDetailsFormKey;
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
            onPressed: () async => await handleUpdatingUserDataFromApi(context),
          );
        }
      }),
    );
  }

  Future<void> handleUpdatingUserDataFromApi(BuildContext context) async {
    if (UpdateUserCubit.get(context).userProfileModel.gender.isEmpty) {
      showSnackBar(context, "Select your gender");
      return;
    }
    if (myDetailsFormKey.currentState!.validate()) {
      UpdateUserCubit.get(context).userProfileModel.gender =
          userModel.userModel.gender;
      UpdateUserCubit.get(context).userProfileModel.name =
          MyDetailsInputFieldsSection.nameControllerUserUpdate.text;
      UpdateUserCubit.get(context).userProfileModel.phone =
          MyDetailsInputFieldsSection.phoneControllerUserUpdate.text;
      await UpdateUserCubit.get(context).updateUser();
    }
  }
}
