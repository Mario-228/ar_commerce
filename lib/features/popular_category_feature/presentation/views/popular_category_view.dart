import 'package:flutter/material.dart';
import '../../../../core/widgets/category_app_bar.dart';
import 'widgets/popular_grid_view.dart';

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
