import 'package:flutter/material.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/home_view_body.dart';
import 'package:graduation_project/features/others_category_feature/presentation/views/others_category_view.dart';
import 'package:graduation_project/features/popular_category_feature/presentation/views/popular_category_view.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/profile_view.dart';
import 'package:graduation_project/features/accessories_category_feature/presentation/views/accessories_category_view.dart';
import 'package:graduation_project/features/clothes_category_feature/presentation/views/clothes_category_view.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views/furniture_category_view.dart';

abstract class NavigationBarScreens {
  static const List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag),
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
}
