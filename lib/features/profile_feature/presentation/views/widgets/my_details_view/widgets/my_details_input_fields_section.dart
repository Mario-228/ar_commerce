import 'package:flutter/material.dart';
// import 'package:graduation_project/constants.dart';
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
          labelText: "Name",
          controller: UpdateUserCubit.get(context).nameController,
          icon: Icons.person,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Insert name";
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 10.0),
        CustomTextFormField(
          icon: Icons.phone,
          type: TextInputType.phone,
          labelText: "Phone",
          controller: UpdateUserCubit.get(context).phoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Insert phone number";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
