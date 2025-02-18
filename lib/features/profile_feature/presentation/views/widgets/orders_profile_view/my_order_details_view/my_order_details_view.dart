import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/core/widgets/custom_appbar.dart';
import 'package:graduation_project/features/profile_feature/presentation/views/widgets/orders_profile_view/my_order_details_view/widgets/my_order_details_view_body.dart';

class MyOrderDetailsView extends StatelessWidget {
  const MyOrderDetailsView({super.key, required this.productItemModel});
  final CustomProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "My Order"),
      body: MyOrderDetailsViewBody(
        productItemModel: productItemModel,
      ),
    );
  }
}
