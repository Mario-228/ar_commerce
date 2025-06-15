import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/get_it_service/get_it_service.dart';
import '../../../../core/widgets/category_app_bar.dart';
import '../../../home_feature/presentation/views_models/get_product_cubit/get_product_cubit.dart';
import 'widgets/popular_grid_view.dart';

class PopularCategoryView extends StatelessWidget {
  const PopularCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CategoryAppbar(
        title: "Popular",
      ),
      body: BlocProvider.value(
          value: GetItService.getIt.get<GetProductCubit>()..getProduct(),
          child: PopularProductsGridView()),
    );
  }
}
