import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      contentPadding: const EdgeInsets.all(0),
      minLeadingWidth: 0,
      title: Text(
        "Verification Email",
        style: FontStyles.textStyleBold20.copyWith(color: AppColors.darkGreen),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
