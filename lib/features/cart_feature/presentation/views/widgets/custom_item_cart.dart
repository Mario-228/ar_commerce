import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project_new_version/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project_new_version/core/widgets/order_list_tile.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({super.key, required this.customProductItemModel});
  final CustomProductItemModel customProductItemModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(0.95, -0.95),
      children: [
        OrderListTile(
          productItemModel: customProductItemModel,
          onTap: () => GoRouter.of(context).push(
            AppRouters.kProductDetailsView,
            extra: customProductItemModel,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close, size: 16.0),
          padding: const EdgeInsets.all(0.0),
          constraints: const BoxConstraints(
            minWidth: 32.0,
            minHeight: 32.0,
          ),
        )
      ],
    );
  }
}
