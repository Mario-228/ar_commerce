import 'package:flutter/material.dart';
// import 'package:graduation_project/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../views_models/update_user_cubit/update_user_cubit.dart';

class MyDetailsInputFieldsSection extends StatelessWidget {
  const MyDetailsInputFieldsSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.name,
          labelText: AppLocalizations.of(context)!.name,
          controller: UpdateUserCubit.get(context).nameController,
          icon: Icons.person,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.insertName;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 10.0),
        CustomTextFormField(
          icon: Icons.phone,
          type: TextInputType.phone,
          labelText: AppLocalizations.of(context)!.phoneNumber,
          controller: UpdateUserCubit.get(context).phoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.insertPhoneNumber;
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
