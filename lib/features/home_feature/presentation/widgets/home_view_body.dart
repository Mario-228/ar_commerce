import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_best_sellers_grid_view.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_grid_view_title.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_home_products_grid_view.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/home_categories_list.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/home_view_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: HomeViewHeader(),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 40.0),
                  HomeCategoriesList(),
                  SizedBox(height: 20.0),
                  CustomGridViewTitle(
                    title: "Best Sellers",
                  ),
                  SizedBox(height: 20.0),
                  CustomBestSellersGridView(),
                  SizedBox(
                    height: 20.0,
                    child: Divider(color: AppColors.grey),
                  ),
                  CustomGridViewTitle(
                    title: "Latest Release",
                  ),
                  SizedBox(height: 20.0),
                  CustomHomeProductsGridView(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
