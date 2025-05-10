import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/pay_now_button_bloc_consumer.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

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
            PayNowButtonBlocConsumer(total: total, cartModel: cartModel),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
