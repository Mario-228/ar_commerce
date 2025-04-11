import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/widgets/custom_item_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomItemCartListView(),
        ),
      ],
    );
  }
}
