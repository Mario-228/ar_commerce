import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/category_app_bar.dart';
import '../../data/repos/others_repo_endpoints.dart';
import '../../data/repos/others_repo_implementation.dart';
import '../views_models/get_others_cubit/get_others_cubit.dart';
import 'widgets/others_grid_view.dart';

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
          ..getOthersProducts(
              endPoint: OthersRepoEndpoints.product + OthersRepoEndpoints.id),
        child: const OthersProductsGridView(),
      ),
    );
  }
}
