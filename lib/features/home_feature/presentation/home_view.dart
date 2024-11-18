import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/widgets/custom_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteShade700,
      body: SafeArea(
        child: CustomBottomNavigationBar
            .screens[CustomBottomNavigationBar.selectedIndex],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
