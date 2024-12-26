import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/category_app_bar.dart';
import 'package:graduation_project/features/accessories_category_feature/data/repos/accessories_repo_endpoints.dart';
import 'package:graduation_project/features/accessories_category_feature/data/repos/accessories_repo_implementation.dart';
import 'package:graduation_project/features/accessories_category_feature/presentation/views/widgets/accessories_grid_view.dart';
import 'package:graduation_project/features/accessories_category_feature/presentation/views_models/get_accessories_cubit/get_accessories_cubit.dart';

class AccessoriesCategoryView extends StatelessWidget {
  const AccessoriesCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CategoryAppbar(
        title: "Accessories",
      ),
      body: BlocProvider(
        create: (context) =>
            GetAccessoriesCubit(AccessoriesRepoImplementation())
              ..getAccessories(
                  endPoint: AccessoriesRepoEndpoints.product +
                      AccessoriesRepoEndpoints.id),
        child: const AccessoriesProductsGridView(),
      ),
    );
  }
}
