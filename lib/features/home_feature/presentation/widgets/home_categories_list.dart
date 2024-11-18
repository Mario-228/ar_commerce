import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/features/home_feature/data/models/category_item_model.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/category_item_widget.dart';

class HomeCategoriesList extends StatefulWidget {
  const HomeCategoriesList({super.key});
  static int currentIndex = 0;
  static const List<CategoryItemModel> items = [
    CategoryItemModel(
      title: "Popular",
      icon: Icons.star,
    ),
    CategoryItemModel(
      title: "Furniture",
      icon: Icons.umbrella_outlined,
    ),
    CategoryItemModel(
      title: "Clothes",
      icon: Icons.umbrella_outlined,
    ),
    CategoryItemModel(
      title: "Accessories",
      icon: Icons.umbrella_outlined,
    ),
    CategoryItemModel(
      title: "Others",
      icon: Icons.umbrella_outlined,
    ),
  ];
  @override
  State<HomeCategoriesList> createState() => _HomeCategoriesListState();
}

class _HomeCategoriesListState extends State<HomeCategoriesList> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 70.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                HomeCategoriesList.currentIndex = index;
              });
              if (index == 0) {
                GoRouter.of(context).push(AppRouters.kPopularCategoryView);
              } else if (index == 1) {
                GoRouter.of(context).push(AppRouters.kFurnitureCategoryView);
              } else if (index == 2) {
                GoRouter.of(context).push(AppRouters.kClothesCategoryView);
              } else if (index == 3) {
                GoRouter.of(context).push(AppRouters.kAccessoriesCategoryView);
              } else if (index == 4) {
                GoRouter.of(context).push(AppRouters.kOthersCategoryView);
              }
            },
            child: CategoryItemWidget(
              item: HomeCategoriesList.items[index],
              isSelected: index == HomeCategoriesList.currentIndex,
            )),
        itemCount: HomeCategoriesList.items.length,
        separatorBuilder: (context, index) =>
            SizedBox(width: (width - 40 - 5 * 45) / 4),
      ),
    );
  }
}
