import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/product_item_favourite_button.dart';

class ImageWithFavouriteButton extends StatelessWidget {
  const ImageWithFavouriteButton({
    super.key,
    required this.productItemModel,
  });
  final CustomProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.52,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image(
              image: NetworkImage(productItemModel.pictureUrl),
            ),
          ),
          ProductItemFavouriteButton(
              onFavouritePressed: () {},
              isFavorite: productItemModel.isFavorite)
        ],
      ),
    );
  }
}
