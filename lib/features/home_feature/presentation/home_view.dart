import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/features/accessories_category_feature/presentation/views/accessories_category_view.dart';
import 'package:graduation_project/features/clothes_category_feature/presentation/views/clothes_category_view.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views/furniture_category_view.dart';
import 'package:graduation_project/features/home_feature/presentation/views_models/home_navigation_bar_cubit/home_navigation_bar_cubit.dart';
import 'package:graduation_project/features/home_feature/presentation/views_models/home_navigation_bar_cubit/home_navigation_bar_states.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/home_view_body.dart';
import 'package:graduation_project/features/others_category_feature/presentation/views/others_category_view.dart';
import 'package:graduation_project/features/popular_category_feature/presentation/views/popular_category_view.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.externalIndex});
  final int? externalIndex;
  static const List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorite',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
  static const List<Widget> screens = [
    HomeViewBody(),
    Center(
      child: Text('Cart'),
    ),
    Center(
      child: Text('Favorite'),
    ),
    ProfileView(),
    PopularCategoryView(),
    FurnitureCategoryView(),
    ClothesCategoryView(),
    AccessoriesCategoryView(),
    OthersCategoryView(),
  ];
  @override
  Widget build(BuildContext context) {
    var indexFromExternal = externalIndex;
    return BlocBuilder<HomeNavigationBarCubit, HomeNavigationBarStates>(
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.whiteShade700,
        body: SafeArea(
          child: screens[indexFromExternal ??
              HomeNavigationBarCubit.get(context).selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          items: HomeView.items,
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
