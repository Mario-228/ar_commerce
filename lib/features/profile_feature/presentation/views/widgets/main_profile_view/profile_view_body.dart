import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/profile_custom_button.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/profile_information_list_view.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/user_profile_header.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            const UserPofileHeader(),
            const SizedBox(height: 50.0),
            const ProfileInformationListView(),
            const SizedBox(height: 60.0),
            ProfileCustomButton(
              radius: 20.0,
              height: 60.0,
              width: 300.0,
              text: "Logout",
              color: AppColors.greyShade500,
              onPressed: () {},
              textColor: AppColors.lightLimeGreen,
            )
          ],
        ),
      ),
    );
  }
}
