import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/category_app_bar.dart';
import 'package:graduation_project/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:graduation_project/features/others_category_feature/presentation/views/widgets/others_grid_view.dart';

class OthersCategoryView extends StatelessWidget {
  const OthersCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CategoryAppbar(
        title: "Others",
      ),
      body: OthersProductsGridView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
