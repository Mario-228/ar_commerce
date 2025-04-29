import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project_new_version/core/widgets/order_list_tile.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views_models/cart_cubit/cart_cubit.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart(
      {super.key, required this.customProductItemModel, this.cartItem});
  final CustomProductItemModel customProductItemModel;
  final CartItem? cartItem;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key ?? Key("CustomItemCart"),
      onDismissed: (direction) async => await CartCubit.get(context)
          .deleteProductFromCart(
              productId: cartItem?.productId ?? customProductItemModel.id,
              quantity: cartItem?.quantity ??
                  1), //must fix the problem with the quantity
      child: Stack(
        alignment: AlignmentDirectional(0.95, -0.95),
        children: [
          OrderListTile(
            cartItem: cartItem,
            productItemModel: customProductItemModel,
            onTap: () => GoRouter.of(context).push(
              AppRouters.kProductDetailsView,
              extra: {
                "model": customProductItemModel,
                "quantity": cartItem?.quantity ?? 1
              },
            ),
          ),
          IconButton(
            onPressed: () async => await CartCubit.get(context)
                .deleteProductFromCart(
                    productId: cartItem?.productId ?? customProductItemModel.id,
                    quantity: cartItem?.quantity ??
                        1), //must fix the problem with the quantity
            icon: const Icon(Icons.close, size: 16.0),
            padding: const EdgeInsets.all(0.0),
            constraints: const BoxConstraints(
              minWidth: 32.0,
              minHeight: 32.0,
            ),
          )
        ],
      ),
    );
  }
}
