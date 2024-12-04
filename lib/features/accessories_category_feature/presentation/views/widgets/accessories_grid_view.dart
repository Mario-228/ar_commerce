import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/home_feature/presentation/widgets/custom_product_item.dart';

class AccessoriesProductsGridView extends StatelessWidget {
  const AccessoriesProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomProductItemModel> productItems = [
      CustomProductItemModel(
        id: 1,
        name: 'Product 1',
        price: 10,
        pictureUrl: 'https://via.placeholder.com/150',
        isFavorite: true,
        productBrand: 'Brand 1',
        productBrandId: 1,
        quantity: 10,
        productTypeId: 1,
        productType: 'Type 1',
        currency: 'L.E ',
        description: 'Description 1',
      ),
      CustomProductItemModel(
        id: 1,
        name: 'Product 1',
        price: 10,
        pictureUrl: 'https://via.placeholder.com/150',
        isFavorite: true,
        productBrand: 'Brand 1',
        productBrandId: 1,
        quantity: 10,
        productTypeId: 1,
        productType: 'Type 1',
        currency: 'L.E ',
        description: 'Description 1',
      ),
      CustomProductItemModel(
        id: 1,
        name: 'Product 1',
        price: 10,
        pictureUrl: 'https://via.placeholder.com/150',
        isFavorite: true,
        productBrand: 'Brand 1',
        productBrandId: 1,
        quantity: 10,
        productTypeId: 1,
        productType: 'Type 1',
        currency: 'L.E ',
        description: 'Description 1',
      ),
      CustomProductItemModel(
        id: 1,
        name: 'Product 1',
        price: 10,
        pictureUrl: 'https://via.placeholder.com/150',
        isFavorite: true,
        productBrand: 'Brand 1',
        productBrandId: 1,
        quantity: 10,
        productTypeId: 1,
        productType: 'Type 1',
        currency: 'L.E ',
        description: 'Description 1',
      ),
    ];
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) =>
          CustomProductItem(productItemModel: productItems[index]),
    );
  }
}
