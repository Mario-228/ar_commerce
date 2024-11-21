import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/category_app_bar.dart';
import 'package:graduation_project/features/popular_category_feature/presentation/views/widgets/popular_grid_view.dart';

class PopularCategoryView extends StatelessWidget {
  const PopularCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CategoryAppbar(
        title: "Popular",
      ),
      body: PopularProductsGridView(),
    );
  }
}
