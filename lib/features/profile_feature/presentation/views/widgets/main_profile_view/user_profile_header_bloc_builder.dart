import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/user_profile_header.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/get_user_cubit/get_user_cubit.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/get_user_cubit/get_user_states.dart';

var defaultUser = UserModel(
  addresses: [],
  imageUrl:
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  userModel: ProfileUserModel(
    email: "email",
    name: "john doe",
    phone: "phone",
    image: "image",
    googleId: "googleId",
    gender: "gender",
    emailVerifiedAt: "emailVerifiedAt",
    id: -1,
    createdAt: "createdAt",
    updatedAt: "updatedAt",
  ),
);

class UserProfileHeaderBlocBuilder extends StatelessWidget {
  const UserProfileHeaderBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserCubit, GetUserStates>(
      listener: (context, state) {
        if (state is GetUserSuccessState) {
          defaultUser = state.userModel;
        }
      },
      builder: (context, state) {
        return UserPofileHeader(
          userModel: defaultUser,
        );
      },
    );
  }
}
