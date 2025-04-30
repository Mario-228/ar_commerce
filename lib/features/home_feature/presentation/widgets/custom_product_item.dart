import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_routers/app_routers.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'image_with_favourite_button.dart';
import 'product_item_details.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.productItemModel,
    this.isHome = false,
  });
  final CustomProductItemModel productItemModel;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouters.kProductDetailsView,
          extra: {"model": productItemModel}),
      child: AspectRatio(
        aspectRatio: 170 / 130,
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(0.0, 20),
              children: [
                ProductItemDetails(productItemModel: productItemModel),
                ImageWithFavouriteButton(
                    productItemModel: productItemModel, isHome: isHome),
              ],
            )
          ],
        ),
      ),
    );
  }
}
