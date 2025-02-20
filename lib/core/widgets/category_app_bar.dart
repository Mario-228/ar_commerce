import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_colors/app_colors.dart';
import '../utils/app_routers/app_routers.dart';
import '../utils/font_styles/font_styles.dart';

class CategoryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppbar({super.key, required this.title});
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
          }),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sort),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
