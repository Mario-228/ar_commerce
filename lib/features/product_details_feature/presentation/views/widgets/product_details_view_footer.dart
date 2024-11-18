import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class ProductDetailsViewFooter extends StatelessWidget {
  const ProductDetailsViewFooter({
    super.key,
  });

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
