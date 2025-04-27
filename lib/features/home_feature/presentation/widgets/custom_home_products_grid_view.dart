import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../views_models/get_product_cubit/get_product_cubit.dart';
import '../views_models/get_product_cubit/get_product_states.dart';
import 'custom_product_item.dart';

class CustomHomeProductsGridView extends StatelessWidget {
  const CustomHomeProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomProductItemModel> productItems = [];
    return BlocBuilder<GetProductCubit, GetProductStates>(
        builder: (context, state) {
      if (state is GetProductSuccessState) {
        productItems = state.productItems;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
      } else if (state is GetProductErrorState) {
        return Center(
          child: Text(state.errorMessageFromApi),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
