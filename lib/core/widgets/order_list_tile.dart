import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    super.key,
    required this.productItemModel,
    this.onTap,
  });

  final CustomProductItemModel productItemModel;
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
          image: NetworkImage(productItemModel.pictureUrl),
        ),
        title: Text(
          productItemModel.name,
          style: FontStyles.textStyleSemiBold14,
        ),
        subtitle: const Text(
          "Est: 15 working days",
          style: FontStyles.textStyleSemiBold8,
        ),
        trailing: Text(
          "${productItemModel.price} ${productItemModel.currency}",
          style: FontStyles.textStyleBold13,
        ),
        onTap: onTap,
      ),
    );
  }
}
