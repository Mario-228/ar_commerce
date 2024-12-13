import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_product_item.dart';
import 'package:graduation_project/features/others_category_feature/presentation/views_models/get_others_cubit/get_others_cubit.dart';
import 'package:graduation_project/features/others_category_feature/presentation/views_models/get_others_cubit/get_others_states.dart';

class OthersProductsGridView extends StatelessWidget {
  const OthersProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomProductItemModel> productItems = [];

    return BlocBuilder<GetOthersCubit, GetOthersStates>(
        builder: (context, state) {
      if (state is GetOthersSuccessState) {
        productItems = state.productItems;
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
      } else if (state is GetOthersFailedState) {
        return Center(child: Text(state.errorMsg));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
