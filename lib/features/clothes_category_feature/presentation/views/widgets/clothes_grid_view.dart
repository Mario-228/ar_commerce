import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import '../../../../home_feature/presentation/widgets/custom_product_item.dart';
import '../../views_models/get_clothes_cubit/get_clothes_cubit.dart';
import '../../views_models/get_clothes_cubit/get_clothes_states.dart';

class ClothesProductsGridView extends StatelessWidget {
  const ClothesProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomProductItemModel> productItems = [];

    return BlocBuilder<GetClothesCubit, GetClothesStates>(
        builder: (context, state) {
      if (state is GetClothesSuccessState) {
        productItems = state.clothesProducts;
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
      } else if (state is GetClothesFailedState) {
        return Center(
          child: Text(state.errorMsg),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}


/*
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) =>
                  CustomProductItem(productItemModel: productItems[index]),
            );
*/