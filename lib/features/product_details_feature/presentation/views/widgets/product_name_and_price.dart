import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../home_feature/presentation/widgets/product_item_favourite_button.dart';
import 'item_counter.dart';

class ProductNameAndPrice extends StatelessWidget {
  const ProductNameAndPrice({
    super.key,
    required this.model,
    this.quantity,
  });
  final CustomProductItemModel model;
  final int? quantity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              model.name,
              style: FontStyles.textStyleRegular20,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 30,
            width: 30,
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
            ItemCounter(model: model, quantity: quantity),
          ]),
    );
  }
}
