import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/add_new_address_cubit/add_new_address_cubit.dart';

class NewAddressInputFeilds extends StatelessWidget {
  const NewAddressInputFeilds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AddNewAddressCubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            type: TextInputType.name,
            labelText: "Full Name",
            controller: AddNewAddressCubit.name,
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
            controller: AddNewAddressCubit.email,
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
            controller: AddNewAddressCubit.phone,
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
            controller: AddNewAddressCubit.address,
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
