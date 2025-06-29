import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project_new_version/features/cart_feature/data/models/cart_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/checkout_total_with_shipping.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/custom_checkout_text_form_field_section.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/get_addresses_loading_widget_bloc_consumer.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/select_delivery_state_drop_down_menu_bloc_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody(
      {super.key, required this.total, required this.cartModel});
  final double total;
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(AppLocalizations.of(context)!.selectDeliveryState,
                style: FontStyles.textStyleRegular16),
            SizedBox(height: 20.0),
            GetAddressesLoadingWidgetBlocConsumer(),
            SelectDeliveryStateDropDownMenuBlocBuilder(),
            SizedBox(height: 20.0),
            CustomCheckoutTextFormFieldSection(),
            SizedBox(height: 20.0),
            CheckoutTotalWithShipping(total: total, cartModel: cartModel),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
