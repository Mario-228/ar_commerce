import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/image_with_favourite_button.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/product_item_details.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.productItemModel,
  });
  final CustomProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouters.kProductDetailsView),
      child: AspectRatio(
        aspectRatio: 170 / 130,
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(0.0, 20),
              children: [
                ProductItemDetails(productItemModel: productItemModel),
                ImageWithFavouriteButton(productItemModel: productItemModel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
