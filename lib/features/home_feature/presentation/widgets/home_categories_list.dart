import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/features/home_feature/data/models/category_item_model.dart';

class HomeCategoriesList extends StatefulWidget {
  const HomeCategoriesList({super.key});
  static const List<CategoryItemModel> items = [
    CategoryItemModel(
      title: "Best Sellers",
      image: AppImages.assetsImagesBestSellers,
    ),
    CategoryItemModel(
      title: "Furniture",
      image: AppImages.assetsImagesFurnitureLogo,
    ),
    CategoryItemModel(
      title: "Clothes",
      image: AppImages.assetsImagesClothesLogo,
    ),
    CategoryItemModel(
      title: "Accessories",
      image: AppImages.assetsImagesAccessories,
    ),
    CategoryItemModel(
      title: "Others",
      image: AppImages.assetsImagesOthers,
    ),
  ];
  @override
  State<HomeCategoriesList> createState() => _HomeCategoriesListState();
}

class _HomeCategoriesListState extends State<HomeCategoriesList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: CarouselSlider(
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
          height: 400.0,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: HomeCategoriesList.items
            .map(
              (item) =>
                  HomeCategoryItemView(currentIndex: currentIndex, item: item),
            )
            .toList(),
      ),
    );
  }
}

class HomeCategoryItemView extends StatelessWidget {
  const HomeCategoryItemView({
    super.key,
    required this.currentIndex,
    required this.item,
  });

  final int currentIndex;
  final CategoryItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context)
          .push(AppRouters.kHomeView, extra: currentIndex + 4),
      child: Image.asset(
        item.image,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
