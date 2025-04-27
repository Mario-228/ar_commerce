import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class ProductDetailsViewFooter extends StatelessWidget {
  const ProductDetailsViewFooter({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: AppColors.black)),
          child: const Text("Add to cart", style: FontStyles.textStyleMedium12),
        ),
        const SizedBox(
          width: 20.0,
        ),
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: AppColors.darkGreen,
          child: const Text(
            "Set in your space",
            style: FontStyles.textStyleMeduimWhite13,
          ),
        )
      ],
    );
  }
}
