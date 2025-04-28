import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/widgets/custom_item_cart_list_view_bloc_builder.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/widgets/delete_and_checkout_cart.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomItemCartListViewBlocBuilder(),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DeleteAndCheckoutCart(),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
