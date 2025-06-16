import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class CustomCheckoutTextFormFieldSection extends StatelessWidget {
  const CustomCheckoutTextFormFieldSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.deliveryDetails,
            style: FontStyles.textStyleRegular16),
        SizedBox(height: 10.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.name,
          labelText: AppLocalizations.of(context)!.fullName,
          controller: CheckoutCubit.get(context).nameController,
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.emailAddress,
          labelText: AppLocalizations.of(context)!.email,
          controller: CheckoutCubit.get(context).emailController,
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.phone,
          labelText: AppLocalizations.of(context)!.phone,
          controller: CheckoutCubit.get(context).phoneController,
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          readOnly: true,
          type: TextInputType.streetAddress,
          labelText: AppLocalizations.of(context)!.address,
          controller: CheckoutCubit.get(context).addressController,
        ),
      ],
    );
  }
}
