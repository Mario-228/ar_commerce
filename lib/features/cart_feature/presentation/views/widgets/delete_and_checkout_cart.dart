import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views_models/cart_cubit/cart_states.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Total:",
                    style: FontStyles.textStyleGreySemiBold20,
                  ),
                  SizedBox(width: 10.0),
                  TotalBlocBuilder(),
                ],
              ),
              Text(
                "D e l i v e r y  e x c l u s i v e",
                style: FontStyles.textStyleSemiBold8,
              ),
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: CustomMaterialButton(
            color: AppColors.darkGreen,
            text: "Checkout",
            onPressed: () {},
          ),
        ),
        // Expanded(
        //   child: CustomMaterialButton(
        //     color: AppColors.darkGreen,
        //     text: "Delete Cart",
        //     onPressed: () async => await CartCubit.get(context).deleteCart(),
        //   ),
        // ),
      ],
    );
  }
}

class TotalBlocBuilder extends StatelessWidget {
  const TotalBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        if (state is GetCartSuccessState) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "${state.cartModel.totalCart} LE",
              style: FontStyles.textStyleBold24,
            ),
          );
        }
        return Text(
          "0 LE",
          style: FontStyles.textStyleBold24,
        );
      },
    );
  }
}
