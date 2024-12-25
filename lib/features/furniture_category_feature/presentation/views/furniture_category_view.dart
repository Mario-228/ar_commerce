import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/category_app_bar.dart';
import 'package:graduation_project/features/furniture_category_feature/data/repos/furniture_repo_endpoints.dart';
import 'package:graduation_project/features/furniture_category_feature/data/repos/furniture_repo_implementation.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views/widgets/furniture_grid_view.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views_models/get_furniture_cubit/get_furniture_cubit.dart';

class FurnitureCategoryView extends StatelessWidget {
  const FurnitureCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CategoryAppbar(title: "Furniture"),
      body: BlocProvider(
        create: (context) => GetFurnitureCubit(FurnitureRepoImplementation())
          ..getFurnitureProducts(
              endPoint:
                  FurnitureRepoEndpoints.product + FurnitureRepoEndpoints.id),
        child: const FurnitureProductsGridView(),
      ),
    );
  }
}
