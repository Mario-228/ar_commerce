import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class CategoryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: AppColors.lightGrey,
      backgroundColor: AppColors.white,
      title: const Text(
        "Chair",
        style: FontStyles.textStyleBold22,
      ),
      centerTitle: true,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new), onPressed: () {}),
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
