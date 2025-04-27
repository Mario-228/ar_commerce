import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../data/models/profile_user_model.dart';
import '../../../views_models/update_user_cubit/update_user_cubit.dart';
import '../../../views_models/update_user_cubit/update_user_states.dart';

class UserProfileHeaderUpdateUserBlocBuilder extends StatelessWidget {
  const UserProfileHeaderUpdateUserBlocBuilder({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserCubit, UpdateUserStates>(
      builder: (context, state) {
        bool isUpdate = state is UpdateUserSuccessState;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 37.5,
              foregroundImage: NetworkImage(
                  isUpdate ? state.userModel.imageUrl : userModel.imageUrl),
            ),
            const SizedBox(width: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isUpdate
                      ? state.userModel.userModel.name
                      : userModel.userModel.name,
                  style: FontStyles.textStyleRegular16,
                ),
                const SizedBox(height: 10.0),
                Text(
                  isUpdate
                      ? state.userModel.userModel.email
                      : userModel.userModel.email,
                  style: FontStyles.textStyleRegularGrey14,
                ),
                const SizedBox(height: 10.0),
              ],
            )
          ],
        );
      },
    );
  }
}
