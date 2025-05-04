import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_colors/app_colors.dart';
import '../../../../core/utils/app_routers/app_routers.dart';
import 'home_background_container.dart';
import 'stack_header_content.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        HomeBackgroundContainer(),
        StackHeaderContent(),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            color: AppColors.white,
            iconSize: 30,
            icon: const Icon(Icons.search),
            onPressed: () {
              GoRouter.of(context).push(AppRouters.kSearchView);
            },
          ),
        )
      ],
    );
  }
}
