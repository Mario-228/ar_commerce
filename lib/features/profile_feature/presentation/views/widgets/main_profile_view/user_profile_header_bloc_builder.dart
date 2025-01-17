import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
// import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/user_profile_header.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/get_user_cubit/get_user_cubit.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/get_user_cubit/get_user_states.dart';

class UserProfileHeaderBlocBuilder extends StatelessWidget {
  const UserProfileHeaderBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserCubit, GetUserStates>(
      listener: (context, state) {
        if (state is GetUserErrorState) {
          showSnackBar(context,
              "Something Wrong Happened Try To Click the Refresh Button");
        }
      },
      builder: (context, state) {
        if (state is GetUserSuccessState) {
          userModel = state.userModel;
          return UserPofileHeader(
            userModel: state.userModel,
          );
        } else if (state is GetUserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return UserPofileHeader(
            userModel: defaultUser,
          );
        }
      },
    );
  }
}
