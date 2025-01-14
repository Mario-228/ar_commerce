import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/custom_product_item_model/custom_product_item_model.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.model});
  final CustomProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProductDetailsViewBody(model: model),
      ),
    );
  }
}
