import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../home_feature/presentation/widgets/custom_product_item.dart';
import '../../views_models/get_accessories_cubit/get_accessories_cubit.dart';
import '../../views_models/get_accessories_cubit/get_accessories_states.dart';

class AccessoriesProductsGridView extends StatelessWidget {
  const AccessoriesProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomProductItemModel> productItems = [];

    return BlocBuilder<GetAccessoriesCubit, GetAccessoriesStates>(
      builder: (BuildContext context, GetAccessoriesStates state) {
        if (state is GetAccessoriesSuccessState) {
          productItems = state.accessoriesProducts;
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
        } else if (state is GetAccessoriesFailedState) {
          return Center(child: Text(state.errorMsg));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
