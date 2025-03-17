import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/orders_profile_view/my_orders_view/widgets/my_orders_view_body.dart';

import '../../../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import '../../../../../../../core/widgets/custom_appbar.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "My Orders",
      ),
      body: MyOrdersViewBody(
        productItemModel: CustomProductItemModel(
            id: 1,
            name: "Product",
            description: "product description",
            pictureUrl:
                "https://media.istockphoto.com/id/1222357475/vector/image-preview-icon-picture-placeholder-for-website-or-ui-ux-design-vector-illustration.jpg?s=2048x2048&w=is&k=20&c=CJLIU6nIISsrHLTVO04nxIH2zVaKbnUeUXp7PnpM2h4=",
            price: 500.0,
            currency: "L.E",
            isFavorite: false,
            productBrandId: 0,
            productTypeId: 0,
            quantity: 5,
            productBrand: "",
            productType: "",
            image3DUrl: ""),
      ),
    );
  }
}
