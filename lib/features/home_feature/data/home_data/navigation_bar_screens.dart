import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/cart_view.dart';
import 'package:graduation_project_new_version/features/favourites_feature/presentation/views/favourites_view.dart';
import '../../../accessories_category_feature/presentation/views/accessories_category_view.dart';
import '../../../clothes_category_feature/presentation/views/clothes_category_view.dart';
import '../../../furniture_category_feature/presentation/views/furniture_category_view.dart';
import '../../../others_category_feature/presentation/views/others_category_view.dart';
import '../../../popular_category_feature/presentation/views/popular_category_view.dart';
import '../../../profile_feature/presentation/views/profile_view.dart';
import '../../presentation/widgets/home_view_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class NavigationBarScreens {
  static List<BottomNavigationBarItem> items(BuildContext context) => [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: AppLocalizations.of(context)!.cart,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: AppLocalizations.of(context)!.favorite,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppLocalizations.of(context)!.profile,
        ),
      ];
  static const List<Widget> screens = [
    HomeViewBody(),
    CartView(),
    FavouritesView(),
    ProfileView(),
    PopularCategoryView(),
    FurnitureCategoryView(),
    ClothesCategoryView(),
    AccessoriesCategoryView(),
    OthersCategoryView(),
  ];
}
