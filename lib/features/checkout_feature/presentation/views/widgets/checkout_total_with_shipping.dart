import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/pay_now_button_bloc_consumer.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              leading: Text(
                AppLocalizations.of(context)!.subtotal,
                style: FontStyles.textStyleSemiBold14,
              ),
              trailing: Text(
                "$total ${AppLocalizations.of(context)!.le}",
                style: FontStyles.textStyleSemiBold14,
              ),
            ),
            ListTile(
              leading: Text(
                AppLocalizations.of(context)!.shipping,
                style: FontStyles.textStyleSemiBold14,
              ),
              trailing: Text(
                "20 ${AppLocalizations.of(context)!.le}",
                style: FontStyles.textStyleSemiBold14,
              ),
            ),
            ListTile(
              leading: Text(
                AppLocalizations.of(context)!.total,
                style: FontStyles.textStyleBoldOrange16,
              ),
              trailing: Text(
                "${total + 20} ${AppLocalizations.of(context)!.le}",
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
