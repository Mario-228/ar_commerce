import 'package:flutter/material.dart';
import 'package:graduation_project/features/category_feature/presentation/views/widgets/category_app_bar.dart';
import 'package:graduation_project/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_products_grid_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CategoryAppbar(),
        body: SingleChildScrollView(
          child: CustomProductsGridView(),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
