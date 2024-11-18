import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/category_app_bar.dart';
import 'package:graduation_project/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views/widgets/furniture_grid_view.dart';

class AccessoriesCategoryView extends StatelessWidget {
  const AccessoriesCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CategoryAppbar(
        title: "Accessories",
      ),
      body: FurnitureProductsGridView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
