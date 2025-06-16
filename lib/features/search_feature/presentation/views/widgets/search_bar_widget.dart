import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/search_feature/presentation/models_views/get_search_products_cubit/get_search_products_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: GetSearchProductsCubit.searchController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          fillColor: AppColors.white,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(11.0)),
          ),
          hintText: AppLocalizations.of(context)!.searchItem,
          hintStyle: FontStyles.textStyleLight10,
          prefixIcon: IconButton(
            onPressed: () {
              GetSearchProductsCubit.get(context).getSearchProducts(
                  GetSearchProductsCubit.searchController.text);
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
