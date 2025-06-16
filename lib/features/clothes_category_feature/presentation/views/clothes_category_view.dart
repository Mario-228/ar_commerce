import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/get_it_service/get_it_service.dart';
import '../../../../core/widgets/category_app_bar.dart';
import '../../data/repos/clothes_repo_endpoints.dart';
import '../views_models/get_clothes_cubit/get_clothes_cubit.dart';
import 'widgets/clothes_grid_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClothesCategoryView extends StatelessWidget {
  const ClothesCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppbar(
        title: AppLocalizations.of(context)!.clothesCategory,
      ),
      body: BlocProvider.value(
        value: GetItService.getIt.get<GetClothesCubit>()
          ..getClothes(
              endPoint: ClothesRepoEndpoints.product + ClothesRepoEndpoints.id),
        child: const ClothesProductsGridView(),
      ),
    );
  }
}
