import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_colors/app_colors.dart';
import '../data/home_data/navigation_bar_screens.dart';
import 'views_models/home_navigation_bar_cubit/home_navigation_bar_cubit.dart';
import 'views_models/home_navigation_bar_cubit/home_navigation_bar_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.externalIndex});
  final int? externalIndex;
  @override
  Widget build(BuildContext context) {
    var indexFromExternal = externalIndex;
    return BlocBuilder<HomeNavigationBarCubit, HomeNavigationBarStates>(
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.whiteShade700,
        body: NavigationBarScreens.screens[indexFromExternal ??
            HomeNavigationBarCubit.get(context).selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          items: NavigationBarScreens.items,
          elevation: 5.0,
          selectedItemColor: AppColors.orange,
          unselectedItemColor: AppColors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: HomeNavigationBarCubit.get(context).selectedIndex,
          onTap: (index) {
            indexFromExternal = index;
            HomeNavigationBarCubit.get(context).changeIndex(index);
          },
        ),
      ),
    );
  }
}
