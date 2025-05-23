import 'package:flutter/material.dart';
import '../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';
import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.model, this.quantity});
  final CustomProductItemModel model;
  final int? quantity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProductDetailsViewBody(model: model, quantity: quantity),
      ),
    );
  }
}
