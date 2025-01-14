import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/description_and_reviews_buttons.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_color_choices.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_delivery.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_details_view_footer.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_name_and_price.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductNameAndPrice(model: model),
          const ProductColorChoices(),
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
      ),
    );
  }
}
