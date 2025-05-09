import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';

import '../utils/app_colors/app_colors.dart';
import '../utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../utils/font_styles/font_styles.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    super.key,
    required this.productItemModel,
    this.onTap,
    this.cartItem,
  });

  final CustomProductItemModel productItemModel;
  final CartItem? cartItem;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      child: ListTile(
        tileColor: AppColors.white,
        minTileHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        leading: Image(
          width: 60.0,
          height: double.infinity,
          image: NetworkImage(
              (cartItem?.product.pictureUrl) ?? productItemModel.pictureUrl),
        ),
        title: Text(
          (cartItem?.product.name) ?? productItemModel.name,
          style: FontStyles.textStyleSemiBold14,
        ),
        subtitle: const Text(
          "Est: 15 working days",
          style: FontStyles.textStyleSemiBold8,
        ),
        trailing: Text(
          "${(cartItem?.quantity ?? "")} x ${(cartItem?.product.price) ?? productItemModel.price} ${productItemModel.currency}",
          style: FontStyles.textStyleBold13,
        ),
        onTap: onTap,
      ),
    );
  }
}
