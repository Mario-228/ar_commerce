import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'description_and_reviews_buttons.dart';
import 'product_delivery.dart';
import 'product_details_view_footer.dart';
import 'product_name_and_price.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.model,
    this.quantity,
  });
  final int? quantity;
  final CustomProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductNameAndPrice(model: model, quantity: quantity),
        // const ProductColorChoices(),
        const SizedBox(
          height: 30,
        ),
        DescriptionAndReviewsButtons(model: model),
        const SizedBox(
          height: 15,
        ),
        const Divider(
          color: AppColors.greyShade600,
          height: 5,
          thickness: 4,
        ),
        const SizedBox(
          height: 15,
        ),
        const ProductDelivery(),
        const SizedBox(
          height: 30,
        ),
        const Divider(
          color: AppColors.greyShade600,
          height: 0.5,
        ),
        ProductDetailsViewFooter(model: model)
      ],
    );
  }
}
