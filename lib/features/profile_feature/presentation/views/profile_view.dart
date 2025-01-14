import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/profile_app_bar.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/profile_view_body.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/get_user_cubit/get_user_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserCubit()..getUser(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const ProfileAppBar(title: "Profile"),
        body: BlocProvider(
          create: (context) => GetUserCubit()..getUser(),
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
