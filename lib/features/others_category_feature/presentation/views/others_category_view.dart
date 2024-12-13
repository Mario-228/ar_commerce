import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/category_app_bar.dart';
import 'package:graduation_project/features/others_category_feature/data/repos/others_repo_endpoints.dart';
import 'package:graduation_project/features/others_category_feature/data/repos/others_repo_implementation.dart';
import 'package:graduation_project/features/others_category_feature/presentation/views/widgets/others_grid_view.dart';
import 'package:graduation_project/features/others_category_feature/presentation/views_models/get_others_cubit/get_others_cubit.dart';

class OthersCategoryView extends StatelessWidget {
  const OthersCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CategoryAppbar(
        title: "Others",
      ),
      body: BlocProvider(
        create: (context) => GetOthersCubit(OthersRepoImplementation())
          ..getOthersProducts(endPoint: OthersRepoEndpoints.product),
        child: const OthersProductsGridView(),
      ),
    );
  }
}
