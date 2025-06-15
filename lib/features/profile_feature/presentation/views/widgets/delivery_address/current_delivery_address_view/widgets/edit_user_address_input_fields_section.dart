import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/edit_address_cubit/edit_address_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../../core/widgets/custom_text_form_field.dart';

class EditUserAddressInputFieldsSection extends StatelessWidget {
  const EditUserAddressInputFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: EditAddressCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextFormField(
            type: TextInputType.name,
            labelText: AppLocalizations.of(context)!.fullName,
            controller: EditAddressCubit.get(context).nameController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return AppLocalizations.of(context)!.insertName;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.emailAddress,
            labelText: AppLocalizations.of(context)!.email,
            controller: EditAddressCubit.get(context).emailController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return AppLocalizations.of(context)!.insertEmail;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.text,
            labelText: AppLocalizations.of(context)!.phoneNumber,
            controller: EditAddressCubit.get(context).phoneController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return AppLocalizations.of(context)!.insertPhoneNumber;
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.streetAddress,
            labelText: AppLocalizations.of(context)!.address,
            controller: EditAddressCubit.get(context).addressController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return AppLocalizations.of(context)!.insertAddress;
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}
