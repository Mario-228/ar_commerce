import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../views_models/update_user_cubit/update_user_cubit.dart';
import '../../../../views_models/update_user_cubit/update_user_states.dart';

class ProfileImageBlocBuilder extends StatelessWidget {
  const ProfileImageBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserCubit, UpdateUserStates>(
        builder: (context, state) {
      return CircleAvatar(
        radius: 80.0,
        foregroundImage: NetworkImage(state is UpdateUserSuccessState
            ? state.userModel.imageUrl
            : UpdateUserCubit.get(context).userModelCubit.imageUrl),
        backgroundColor: AppColors.white,
      );
    });
  }
}
