import 'package:flutter/material.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_latest_release.dart';
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
                  CustomLatestRelease(),
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
