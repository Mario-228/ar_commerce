import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/checkout_total_with_shipping.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/custom_checkout_text_form_field_section.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views/widgets/select_delivery_state_drop_down_menu.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text("Select Delivery State:",
                style: FontStyles.textStyleRegular16),
            SizedBox(height: 20.0),
            SelectDeliveryStateDropDownMenu(
              items: ["Item 1", "Item 2", "Item 3"],
            ),
            SizedBox(height: 20.0),
            CustomCheckoutTextFormFieldSection(),
            SizedBox(height: 20.0),
            CheckoutTotalWithShipping(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
