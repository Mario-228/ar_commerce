import 'package:flutter/material.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_product_item.dart';

class CustomProductsGridView extends StatelessWidget {
  const CustomProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => const CustomProductItem(
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
