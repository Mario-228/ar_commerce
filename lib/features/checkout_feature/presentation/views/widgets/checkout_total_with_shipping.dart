import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/show_payment_method_bottom_sheet.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_states.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../../core/widgets/custom_material_button.dart';

class CheckoutTotalWithShipping extends StatelessWidget {
  const CheckoutTotalWithShipping(
      {super.key, required this.total, required this.cartModel});
  final double total;
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            ListTile(
              leading: const Text(
                "Subtotal",
                style: FontStyles.textStyleSemiBold14,
              ),
              trailing: Text(
                "$total L.E",
                style: FontStyles.textStyleSemiBold14,
              ),
            ),
            const ListTile(
              leading: Text(
                "Shipping",
                style: FontStyles.textStyleSemiBold14,
              ),
              trailing: Text(
                "20 L.E",
                style: FontStyles.textStyleSemiBold14,
              ),
            ),
            ListTile(
              leading: const Text(
                "Total",
                style: FontStyles.textStyleBoldOrange16,
              ),
              trailing: Text(
                "${total + 20} L.E",
                style: FontStyles.textStyleBoldOrange16,
              ),
            ),
            SizedBox(height: 20.0),
            BlocConsumer<CheckoutCubit, CheckoutState>(
                listener: (context, state) {
              if (state.storeOrderErrorState != null) {
                showSnackBar(context, state.storeOrderErrorState!);
              } else if (state.storeOrderSuccessState != null) {
                showSnackBar(context, "Order Placed Successfully");
              }
            }, builder: (context, state) {
              if (state.isOrderLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return CustomMaterialButton(
                  text: "Pay Now",
                  color: AppColors.darkGreen,
                  onPressed: () async {
                    await CheckoutCubit.get(context)
                        .storeOrder()
                        .then((value) async {
                      if (context.mounted &&
                          state.storeOrderSuccessState != null) {
                        log(state.storeOrderSuccessState!.message);
                        await showPaymentMethodBottomSheet(
                          context: context,
                          total: total,
                          cartModel: cartModel,
                        );
                      }
                    });
                  },
                  height: 60.0,
                );
              }
            }),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
