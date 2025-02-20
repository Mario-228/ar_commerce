import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../home_feature/presentation/widgets/product_item_favourite_button.dart';
import 'item_counter.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(model.name, style: FontStyles.textStyleRegular20),
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
                "${model.price}",
                style: FontStyles.textStyleSemiBold20
                    .copyWith(color: AppColors.glodenOrange),
              ),
              ItemCounter(model: model),
            ]),
      ),
    );
  }
}
