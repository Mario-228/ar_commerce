import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project_new_version/features/home_feature/presentation/widgets/custom_product_item.dart';

class FavouritesGridView extends StatelessWidget {
  const FavouritesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) => CustomProductItem(
          productItemModel: CustomProductItemModel(
              currency: "",
              description: "",
              id: 0,
              image3DUrl:
                  "https://modelviewer.dev/shared-assets/models/Astronaut.glb",
              isFavorite: false,
              name: "",
              pictureUrl:
                  "https://media.istockphoto.com/id/1222357475/vector/image-preview-icon-picture-placeholder-for-website-or-ui-ux-design-vector-illustration.jpg?s=2048x2048&w=is&k=20&c=CJLIU6nIISsrHLTVO04nxIH2zVaKbnUeUXp7PnpM2h4=",
              price: 0,
              productBrand: "",
              productBrandId: 0,
              productType: "",
              productTypeId: 0,
              quantity: 0),
        ),
      ),
    );
  }
}
