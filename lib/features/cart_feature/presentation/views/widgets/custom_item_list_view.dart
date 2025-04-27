import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/constants.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/widgets/custom_item_cart.dart';

class CustomItemCartListView extends StatelessWidget {
  const CustomItemCartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CustomItemCart(
        customProductItemModel: customProductItemModel,
      ),
      separatorBuilder: (context, index) => const SizedBox(),
      itemCount: 5,
    );
  }
}
