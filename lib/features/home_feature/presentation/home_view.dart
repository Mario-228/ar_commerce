import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_home_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteShade700,
      body: SafeArea(
        child: CustomHomeBottomNavigationBar
            .screens[CustomHomeBottomNavigationBar.selectedIndex],
      ),
      bottomNavigationBar: const CustomHomeBottomNavigationBar(),
    );
  }
}
