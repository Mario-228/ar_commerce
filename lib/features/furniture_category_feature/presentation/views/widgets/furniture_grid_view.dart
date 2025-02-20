import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import '../../../../home_feature/presentation/widgets/custom_product_item.dart';
import '../../views_models/get_furniture_cubit/get_furniture_cubit.dart';
import '../../views_models/get_furniture_cubit/get_furniture_states.dart';

class FurnitureProductsGridView extends StatelessWidget {
  const FurnitureProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomProductItemModel> productItems = [];

    return BlocBuilder<GetFurnitureCubit, GetFurnitureStates>(
      builder: (BuildContext context, state) {
        if (state is GetFurnitureSuccessState) {
          productItems = state.furnitureProducts;

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
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
            ),
          );
        } else if (state is GetFurnitureFailedState) {
          return Center(
            child: Text(state.errorMsg),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
