import 'package:flutter/material.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';

class ImageWithFavouriteButton extends StatelessWidget {
  const ImageWithFavouriteButton({
    super.key,
    required this.productItemModel,
    this.isHome = false,
  });
  final CustomProductItemModel productItemModel;
  final bool isHome;
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
          // isHome
          //     ? SizedBox()
          //     : FavouriteButtonBlocBuilder(productItemModel: productItemModel),
        ],
      ),
    );
  }
}
