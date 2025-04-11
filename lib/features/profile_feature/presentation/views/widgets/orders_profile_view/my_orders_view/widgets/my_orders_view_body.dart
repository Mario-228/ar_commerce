import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../../../../core/widgets/order_list_tile.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key, required this.productItemsList});
  final List<CustomProductItemModel> productItemsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => OrderListTile(
        productItemModel: productItemsList[index],
        onTap: () => GoRouter.of(context).push(AppRouters.kMyOrderDetailsView,
            extra: productItemsList[index]),
      ),
      itemCount: productItemsList.length,
    );
  }
}
