import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_product_item.dart';

class ClothesProductsGridView extends StatelessWidget {
  const ClothesProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => CustomProductItem(
        onTap: () => GoRouter.of(context).push(AppRouters.kProductDetailsView),
        isFavorite: true,
        price: '65,000',
        currency: 'L.E ',
        productName: 'Sverom chair',
        image:
            "https://www.befunky.com/images/wp/wp-2018-08-product-photography-18.jpg?auto=avif,webp&format=jpg&width=1200",
      ),
    );
  }
}
