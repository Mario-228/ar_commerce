import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/category_app_bar.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views/widgets/furniture_grid_view.dart';

class FurnitureCategoryView extends StatelessWidget {
  const FurnitureCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CategoryAppbar(title: "Furniture"),
      body: FurnitureProductsGridView(),
    );
  }
}
