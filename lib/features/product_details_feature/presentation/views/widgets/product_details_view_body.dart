import 'package:flutter/material.dart';
import '../../../../../core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'product_3d_view.dart';
import 'product_info.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Product3DView(model: model),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ProductInfo(model: model),
              ],
            ),
          )
        ],
      ),
    );
  }
}
