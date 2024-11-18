import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/product_item_favourite_button.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/item_counter.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Mini sit me", style: FontStyles.textStyleRegular20),
            SizedBox(
              height: 35,
              width: 35,
              child: ProductItemFavouriteButton(
                onFavouritePressed: () {},
                isFavorite: false,
              ),
            ),
          ],
        ),
        subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "N75,000",
                style: FontStyles.textStyleSemiBold20
                    .copyWith(color: AppColors.glodenOrange),
              ),
              const ItemCounter(),
            ]),
      ),
    );
  }
}
