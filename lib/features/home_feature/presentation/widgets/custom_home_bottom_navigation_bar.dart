import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/home_view_body.dart';

class CustomHomeBottomNavigationBar extends StatefulWidget {
  const CustomHomeBottomNavigationBar({
    super.key,
  });
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
  @override
  State<CustomHomeBottomNavigationBar> createState() =>
      _CustomHomeBottomNavigationBarState();
}

class _CustomHomeBottomNavigationBarState
    extends State<CustomHomeBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    const List<BottomNavigationBarItem> items = [
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

    return BottomNavigationBar(
      items: items,
      elevation: 5.0,
      selectedItemColor: AppColors.orange,
      unselectedItemColor: AppColors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: CustomHomeBottomNavigationBar.selectedIndex,
      onTap: (index) {
        setState(() {
          CustomHomeBottomNavigationBar.selectedIndex = index;
        });
      },
    );
  }
}
