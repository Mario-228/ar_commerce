import 'package:flutter/material.dart';

import '../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomCheckoutTextFormFieldSection extends StatelessWidget {
  const CustomCheckoutTextFormFieldSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Delivery Details", style: FontStyles.textStyleRegular16),
        SizedBox(height: 10.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.name,
          labelText: "Full Name",
          controller: TextEditingController(text: "john smith"),
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.emailAddress,
          labelText: "Email",
          controller: TextEditingController(text: "z2hYh@example.com"),
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.phone,
          labelText: "Phone Number",
          controller: TextEditingController(text: "01012345678"),
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.streetAddress,
          labelText: "Address",
          controller: TextEditingController(text: "Cairo, Egypt"),
        ),
      ],
    );
  }
}
