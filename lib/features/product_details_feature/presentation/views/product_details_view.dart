import 'package:flutter/material.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProductDetailsViewBody(),
      ),
    );
  }
}
