import 'package:flutter/material.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/image_with_favourite_button.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/product_item_details.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.price,
    required this.currency,
    required this.image,
    required this.productName,
    this.isFavorite = false,
    this.onTap,
    this.onFavouritePressed,
  });
  final String price;
  final String currency;
  final String image;
  final String productName;
  final bool isFavorite;
  final void Function()? onTap;
  final void Function()? onFavouritePressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 170 / 130,
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(0.0, 20),
              children: [
                ProductItemDetails(
                    productName: productName, currency: currency, price: price),
                ImageWithFavouriteButton(
                    image: image,
                    onFavouritePressed: onFavouritePressed,
                    isFavorite: isFavorite),
              ],
            )
          ],
        ),
      ),
    );
  }
}
