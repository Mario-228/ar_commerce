import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/category_app_bar.dart';
import '../../data/repos/accessories_repo_endpoints.dart';
import '../../data/repos/accessories_repo_implementation.dart';
import '../views_models/get_accessories_cubit/get_accessories_cubit.dart';
import 'widgets/accessories_grid_view.dart';

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
