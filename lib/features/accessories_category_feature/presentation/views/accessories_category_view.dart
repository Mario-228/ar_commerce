import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/get_it_service/get_it_service.dart';
import '../../../../core/widgets/category_app_bar.dart';
import '../../data/repos/accessories_repo_endpoints.dart';
import '../views_models/get_accessories_cubit/get_accessories_cubit.dart';
import 'widgets/accessories_grid_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccessoriesCategoryView extends StatelessWidget {
  const AccessoriesCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppbar(
        title: AppLocalizations.of(context)!.accessoriesCategory,
      ),
      body: BlocProvider.value(
        value: GetItService.getIt.get<GetAccessoriesCubit>()
          ..getAccessories(
              endPoint: AccessoriesRepoEndpoints.product +
                  AccessoriesRepoEndpoints.id),
        child: const AccessoriesProductsGridView(),
      ),
    );
  }
}
