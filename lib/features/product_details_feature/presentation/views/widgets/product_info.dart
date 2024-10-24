import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/description_and_reviews_buttons.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_color_choices.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_delivery.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_description.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_details_view_footer.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_name_and_price.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductNameAndPrice(),
          ProductColorChoices(),
          SizedBox(
            height: 30,
          ),
          DescriptionAndReviewsButtons(),
          ProductDescription(),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: AppColors.greyShade600,
            height: 5,
            thickness: 4,
          ),
          SizedBox(
            height: 15,
          ),
          ProductDelivery(),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: AppColors.greyShade600,
            height: 0.5,
          ),
          ProductDetailsViewFooter()
        ],
      ),
    );
  }
}
