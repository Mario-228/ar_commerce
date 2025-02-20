import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/category_app_bar.dart';
import '../../data/repos/clothes_repo_endpoints.dart';
import '../../data/repos/clothes_repo_implementation.dart';
import '../views_models/get_clothes_cubit/get_clothes_cubit.dart';
import 'widgets/clothes_grid_view.dart';

class ClothesCategoryView extends StatelessWidget {
  const ClothesCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CategoryAppbar(
        title: "Clothes",
      ),
      body: BlocProvider(
        create: (context) => GetClothesCubit(ClothesRepoImplementation())
          ..getClothes(
              endPoint: ClothesRepoEndpoints.product + ClothesRepoEndpoints.id),
        child: const ClothesProductsGridView(),
      ),
    );
  }
}
