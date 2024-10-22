import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';

class ProductItemFavouriteButton extends StatelessWidget {
  const ProductItemFavouriteButton({
    super.key,
    required this.onFavouritePressed,
    required this.isFavorite,
  });

  final void Function()? onFavouritePressed;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.85, -1),
      child: IconButton(
        onPressed: onFavouritePressed,
        icon: CircleAvatar(
          radius: 15.0,
          backgroundColor: AppColors.white,
          child: Center(
            child: isFavorite
                ? const Icon(
                    size: 20.0,
                    Icons.favorite_sharp,
                    color: AppColors.red,
                  )
                : const Icon(
                    size: 20.0,
                    Icons.favorite_border_sharp,
                  ),
          ),
        ),
      ),
    );
  }
}
