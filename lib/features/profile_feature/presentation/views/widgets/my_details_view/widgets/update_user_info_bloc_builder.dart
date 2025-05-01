import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/update_user_cubit/update_user_states.dart';
import '../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../core/widgets/custom_material_button.dart';
import '../../../../views_models/update_user_cubit/update_user_cubit.dart';

class UpdateUserInfoButtonBlocBuilder extends StatelessWidget {
  const UpdateUserInfoButtonBlocBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserCubit, UpdateUserStates>(
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
            if (UpdateUserCubit.get(context)
                .myDetailsFormKey
                .currentState!
                .validate()) {
              await UpdateUserCubit.get(context).updateUser();
            }
          },
        );
      }
    });
  }
}
