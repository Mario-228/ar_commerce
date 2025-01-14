import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/get_user_cubit/get_user_cubit.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: AppColors.lightGrey,
      backgroundColor: AppColors.white,
      title: Text(
        title,
        style: FontStyles.textStyleBold22,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          GoRouter.of(context).push(AppRouters.kHomeView);
        },
      ),
      actions: [
        IconButton(
            onPressed: () => GetUserCubit.get(context).getUser(),
            icon: const Icon(Icons.refresh)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
