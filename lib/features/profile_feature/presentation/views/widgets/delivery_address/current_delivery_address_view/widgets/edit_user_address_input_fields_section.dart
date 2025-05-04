import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/edit_address_cubit/edit_address_cubit.dart';

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
            labelText: "Full Name",
            controller: EditAddressCubit.get(context).nameController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Insert name";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.emailAddress,
            labelText: "Email",
            controller: EditAddressCubit.get(context).emailController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Insert email";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.text,
            labelText: "Phone Number",
            controller: EditAddressCubit.get(context).phoneController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Insert phone number";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.streetAddress,
            labelText: "Address",
            controller: EditAddressCubit.get(context).addressController,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Insert address";
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
