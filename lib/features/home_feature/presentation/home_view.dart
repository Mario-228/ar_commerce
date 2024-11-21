import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
// import 'package:graduation_project/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    this.categoriesScreen,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
  final Widget? categoriesScreen;
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
    Center(
      child: Text('Profile'),
    ),
  ];
  static int selectedIndex = 0;
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteShade700,
      body: SafeArea(
        child:
            widget.categoriesScreen ?? HomeView.screens[HomeView.selectedIndex],
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
        currentIndex: HomeView.selectedIndex,
        onTap: (index) {
          setState(() {
            HomeView.selectedIndex = index;
          });
        },
      ),
    );
  }
}
