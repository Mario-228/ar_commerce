import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors/app_colors.dart';
import '../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import '../../../../core/utils/font_styles/font_styles.dart';

class ProductItemDetails extends StatelessWidget {
  const ProductItemDetails({
    super.key,
    required this.productItemModel,
  });

  final CustomProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: SizedBox(
        height: 100.0,
        child: Card(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productItemModel.name,
                    style: FontStyles.textStyleRegular12),
                Text(
                    productItemModel.currency +
                        productItemModel.price.toString(),
                    style: FontStyles.textStyleSemiBold14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
