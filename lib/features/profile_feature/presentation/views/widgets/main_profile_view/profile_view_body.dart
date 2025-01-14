import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper_keys.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/features/profile_feature/data/repos/profile_repo_implementation.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/profile_custom_button.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/profile_information_list_view.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/main_profile_view/user_profile_header_bloc_builder.dart';

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
            const UserProfileHeaderBlocBuilder(),
            const SizedBox(height: 50.0),
            const ProfileInformationListView(),
            const SizedBox(height: 60.0),
            ProfileCustomButton(
              radius: 20.0,
              height: 60.0,
              width: 300.0,
              text: "Logout",
              color: AppColors.greyShade500,
              onPressed: () async {
                var result =
                    await ProfileRepoImplementation().signOut(userToken);
                result.fold(
                  (error) => showSnackBar(context, error.errorMessage),
                  (value) async => await logoutSuccessfully(context),
                );
              },
              textColor: AppColors.lightLimeGreen,
            )
          ],
        ),
      ),
    );
  }

  Future<void> logoutSuccessfully(BuildContext context) async {
    showSnackBar(context, "Logout successfully");
    GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
    await CacheHelper.saveData<String>(CacheHelperKeys.tokenKey, "");
    userToken = "";
  }
}
