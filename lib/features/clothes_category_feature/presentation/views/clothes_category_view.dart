import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/category_app_bar.dart';
import 'package:graduation_project/features/clothes_category_feature/data/repos/clothes_repo.dart';
import 'package:graduation_project/features/clothes_category_feature/data/repos/clothes_repo_implementation.dart';
import 'package:graduation_project/features/clothes_category_feature/presentation/views/widgets/clothes_grid_view.dart';
import 'package:graduation_project/features/clothes_category_feature/presentation/views_models/get_clothes_cubit/get_clothes_cubit.dart';

class ClothesCategoryView extends StatelessWidget {
  const ClothesCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    ClothesRepo clothesRepo = ClothesRepoImplementation();
    return Scaffold(
      appBar: const CategoryAppbar(
        title: "Clothes",
      ),
      body: BlocProvider(
        create: (context) => GetClothesCubit(clothesRepo),
        child: const ClothesProductsGridView(),
      ),
    );
  }
}
