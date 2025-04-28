import 'package:flutter/widgets.dart';

import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../views_models/cart_cubit/cart_cubit.dart';

class DeleteAndCheckoutCart extends StatelessWidget {
  const DeleteAndCheckoutCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomMaterialButton(
            color: AppColors.darkGreen,
            text: "Checkout",
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: CustomMaterialButton(
            color: AppColors.darkGreen,
            text: "Delete Cart",
            onPressed: () async => await CartCubit.get(context).deleteCart(),
          ),
        ),
      ],
    );
  }
}
