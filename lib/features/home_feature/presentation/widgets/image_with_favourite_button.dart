import 'package:flutter/material.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/product_item_favourite_button.dart';

class ImageWithFavouriteButton extends StatelessWidget {
  const ImageWithFavouriteButton({
    super.key,
    required this.image,
    required this.onFavouritePressed,
    required this.isFavorite,
  });

  final String image;
  final void Function()? onFavouritePressed;
  final bool isFavorite;

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
              image: NetworkImage(image),
            ),
          ),
          ProductItemFavouriteButton(
              onFavouritePressed: onFavouritePressed, isFavorite: isFavorite)
        ],
      ),
    );
  }
}
