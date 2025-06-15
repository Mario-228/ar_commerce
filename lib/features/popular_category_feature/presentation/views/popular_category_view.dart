import 'package:flutter/material.dart';
import '../../../../core/widgets/category_app_bar.dart';
import 'widgets/popular_grid_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PopularCategoryView extends StatelessWidget {
  const PopularCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CategoryAppbar(
        title: AppLocalizations.of(context)!.popular,
      ),
      body: PopularProductsGridView(),
    );
  }
}
