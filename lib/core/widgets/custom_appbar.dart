import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project_new_version/core/utils/font_styles/font_styles.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key,
      required this.title,
      this.canGoBack = false,
      this.actions,
      this.leadingOnPressed});
  final String title;
  final bool canGoBack;
  final List<Widget>? actions;
  final void Function()? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      backgroundColor: AppColors.white,
      shadowColor: AppColors.lightGrey,
      title: Text(title, style: FontStyles.textStyleBold22),
      centerTitle: true,
      leading: canGoBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: leadingOnPressed ??
                  () {
                    GoRouter.of(context).pop();
                  },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
