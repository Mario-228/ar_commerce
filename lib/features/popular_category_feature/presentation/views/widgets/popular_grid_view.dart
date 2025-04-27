import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import '../../../../home_feature/presentation/widgets/custom_product_item.dart';

class PopularProductsGridView extends StatelessWidget {
  const PopularProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomProductItemModel> productItems = [
      CustomProductItemModel(
          id: 1,
          name: 'Product 1',
          price: 10,
          pictureUrl:
              'https://img.freepik.com/free-vector/realistic-textile-sign-opening-soon_52683-18802.jpg?t=st=1736815141~exp=1736818741~hmac=60b7e3bed7b2316bda905dbdd883e368cb5ef029473d08dd478d5fb3e3cb659e&w=740',
          isFavorite: true,
          productBrand: 'Brand 1',
          productBrandId: 1,
          quantity: 10,
          productTypeId: 1,
          productType: 'Type 1',
          currency: 'L.E ',
          description: 'Description 1',
          image3DUrl:
              "https://modelviewer.dev/shared-assets/models/Astronaut.glb"),
      CustomProductItemModel(
          id: 1,
          name: 'Product 1',
          price: 10,
          pictureUrl:
              'https://img.freepik.com/free-vector/realistic-textile-sign-opening-soon_52683-18802.jpg?t=st=1736815141~exp=1736818741~hmac=60b7e3bed7b2316bda905dbdd883e368cb5ef029473d08dd478d5fb3e3cb659e&w=740',
          isFavorite: true,
          productBrand: 'Brand 1',
          productBrandId: 1,
          quantity: 10,
          productTypeId: 1,
          productType: 'Type 1',
          currency: 'L.E ',
          description: 'Description 1',
          image3DUrl:
              "https://modelviewer.dev/shared-assets/models/Astronaut.glb"),
      CustomProductItemModel(
          id: 1,
          name: 'Product 1',
          price: 10,
          pictureUrl:
              'https://img.freepik.com/free-vector/realistic-textile-sign-opening-soon_52683-18802.jpg?t=st=1736815141~exp=1736818741~hmac=60b7e3bed7b2316bda905dbdd883e368cb5ef029473d08dd478d5fb3e3cb659e&w=740',
          isFavorite: true,
          productBrand: 'Brand 1',
          productBrandId: 1,
          quantity: 10,
          productTypeId: 1,
          productType: 'Type 1',
          currency: 'L.E ',
          description: 'Description 1',
          image3DUrl:
              "https://modelviewer.dev/shared-assets/models/Astronaut.glb"),
      CustomProductItemModel(
          id: 1,
          name: 'Product 1',
          price: 10,
          pictureUrl:
              'https://img.freepik.com/free-vector/realistic-textile-sign-opening-soon_52683-18802.jpg?t=st=1736815141~exp=1736818741~hmac=60b7e3bed7b2316bda905dbdd883e368cb5ef029473d08dd478d5fb3e3cb659e&w=740',
          isFavorite: true,
          productBrand: 'Brand 1',
          productBrandId: 1,
          quantity: 10,
          productTypeId: 1,
          productType: 'Type 1',
          currency: 'L.E ',
          description: 'Description 1',
          image3DUrl:
              "https://modelviewer.dev/shared-assets/models/Astronaut.glb"),
    ];
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: productItems.length,
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
