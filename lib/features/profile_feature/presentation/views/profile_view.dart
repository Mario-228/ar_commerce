import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors/app_colors.dart';
import '../views_models/get_user_cubit/get_user_cubit.dart';
import 'widgets/main_profile_view/profile_app_bar.dart';
import 'widgets/main_profile_view/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserCubit()..getUser(),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        appBar: ProfileAppBar(title: "Profile"),
        body: ProfileViewBody(),
      ),
    );
  }
}
