import 'package:flutter/material.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_3d_view.dart';
import 'package:graduation_project/features/product_details_feature/presentation/views/widgets/product_info.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Product3DView(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              ProductInfo(),
            ],
          ),
        )
      ],
    );
  }
}
