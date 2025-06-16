import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/get_it_service/get_it_service.dart';
import '../../../../core/widgets/category_app_bar.dart';
import '../../data/repos/furniture_repo_endpoints.dart';
import '../views_models/get_furniture_cubit/get_furniture_cubit.dart';
import 'widgets/furniture_grid_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FurnitureCategoryView extends StatelessWidget {
  const FurnitureCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppbar(
          title: AppLocalizations.of(context)!.furnitureCategory),
      body: BlocProvider.value(
        value: GetItService.getIt.get<GetFurnitureCubit>()
          ..getFurnitureProducts(
              endPoint:
                  FurnitureRepoEndpoints.product + FurnitureRepoEndpoints.id),
        child: const FurnitureProductsGridView(),
      ),
    );
  }
}
