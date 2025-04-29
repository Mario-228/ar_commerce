import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project_new_version/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project_new_version/features/cart_feature/presentation/views/widgets/total_cart_bloc_builder.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/widgets/custom_material_button.dart';

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
                  TotalCartBlocBuilder(),
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
            onPressed: () =>
                GoRouter.of(context).push(AppRouters.kCheckoutView),
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
