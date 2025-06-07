import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/get_it_service/get_it_service.dart';
import '../../../../core/widgets/category_app_bar.dart';
import '../../data/repos/others_repo_endpoints.dart';
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
      body: BlocProvider.value(
        value: GetItService.getIt.get<GetOthersCubit>()
          ..getOthersProducts(
              endPoint: OthersRepoEndpoints.product + OthersRepoEndpoints.id),
        child: const OthersProductsGridView(),
      ),
    );
  }
}
