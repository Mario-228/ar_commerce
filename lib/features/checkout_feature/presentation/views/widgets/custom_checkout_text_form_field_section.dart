import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';

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
          controller: CheckoutCubit.get(context).nameController,
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.emailAddress,
          labelText: "Email",
          controller: CheckoutCubit.get(context).emailController,
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.phone,
          labelText: "Phone Number",
          controller: CheckoutCubit.get(context).phoneController,
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.streetAddress,
          labelText: "Address",
          controller: CheckoutCubit.get(context).addressController,
        ),
      ],
    );
  }
}
