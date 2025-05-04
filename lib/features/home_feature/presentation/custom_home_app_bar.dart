import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_colors/app_colors.dart';
import '../../../core/utils/app_routers/app_routers.dart';
import '../../../core/utils/font_styles/font_styles.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Home",
        style: FontStyles.textStyleBold22,
      ),
      backgroundColor: AppColors.white,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        IconButton(
          color: AppColors.darkGreen,
          icon: const Icon(Icons.search),
          onPressed: () {
            GoRouter.of(context).push(AppRouters.kSearchView);
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
