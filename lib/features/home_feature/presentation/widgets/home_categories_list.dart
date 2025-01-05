import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/features/home_feature/data/models/category_item_model.dart';
// import 'package:graduation_project/features/home_feature/presentation/widgets/category_item_widget.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class HomeCategoriesList extends StatefulWidget {
//   const HomeCategoriesList({super.key});
//   static int currentIndex = 0;
//   static const List<CategoryItemModel> items = [
//     CategoryItemModel(
//       title: "Best Sellers",
//       icon: Icons.star,
//     ),
//     CategoryItemModel(
//       title: "Furniture",
//       icon: Icons.chair,
//     ),
//     CategoryItemModel(
//       title: "Clothes",
//       icon: Icons.shower,
//     ),
//     CategoryItemModel(
//       title: "Accessories",
//       icon: Icons.headphones,
//     ),
//     CategoryItemModel(
//       title: "Others",
//       icon: Icons.other_houses,
//     ),
//   ];
//   @override
//   State<HomeCategoriesList> createState() => _HomeCategoriesListState();
// }

// class _HomeCategoriesListState extends State<HomeCategoriesList> {
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return SizedBox(
//       height: 70.0,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) => GestureDetector(
//           onTap: () {
//             setState(() {
//               HomeCategoriesList.currentIndex = index;
//             });
//             GoRouter.of(context).push(AppRouters.kHomeView, extra: index + 4);
//           },
//           child: CategoryItemWidget(
//             item: HomeCategoriesList.items[index],
//             isSelected: index == HomeCategoriesList.currentIndex,
//           ),
//         ),
//         itemCount: HomeCategoriesList.items.length,
//         separatorBuilder: (context, index) =>
//             SizedBox(width: (width - 40 - 5 * 45) / 4),
//       ),
//     );
//   }
// }
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
              (item) => GestureDetector(
                onTap: () => GoRouter.of(context)
                    .push(AppRouters.kHomeView, extra: currentIndex + 4),
                child: Center(
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
