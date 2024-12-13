import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views_models/get_furniture_cubit/get_furniture_cubit.dart';
import 'package:graduation_project/features/furniture_category_feature/presentation/views_models/get_furniture_cubit/get_furniture_states.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_product_item.dart';

class FurnitureProductsGridView extends StatelessWidget {
  const FurnitureProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomProductItemModel> productItems = [];

    return BlocBuilder<GetFurnitureCubit, GetFurnitureStates>(
      builder: (BuildContext context, state) {
        if (state is GetFurnitureSuccessState) {
          log("state succeeed");
          productItems = state.furnitureProducts;
          log(productItems.toString());
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: productItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) =>
                CustomProductItem(productItemModel: productItems[index]),
          );
        } else if (state is GetFurnitureFailedState) {
          log("state failed");
          return Center(
            child: Text(state.errorMsg),
          );
        } else {
          log("state loading");
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
