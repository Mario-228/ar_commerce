import 'package:flutter/material.dart';
import '../../features/home_feature/presentation/widgets/home_view_body.dart';
import '../utils/app_colors/app_colors.dart';

//this class don't used in this project ... may be used in the future
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
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
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
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
      backgroundColor: AppColors.white,
      items: items,
      elevation: 5.0,
      selectedItemColor: AppColors.orange,
      unselectedItemColor: AppColors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: CustomBottomNavigationBar.selectedIndex,
      onTap: (index) {
        setState(() {
          CustomBottomNavigationBar.selectedIndex = index;
        });
      },
    );
  }
}
