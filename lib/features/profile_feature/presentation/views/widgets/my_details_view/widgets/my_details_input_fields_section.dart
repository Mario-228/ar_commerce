import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';

class MyDetailsInputFieldsSection extends StatelessWidget {
  const MyDetailsInputFieldsSection({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.name,
          labelText: "Name",
          controller: nameController,
          icon: Icons.person,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Insert name";
            }
            return null;
          },
        ),
        const SizedBox(height: 10.0),
        CustomTextFormField(
          icon: Icons.phone,
          type: TextInputType.phone,
          labelText: "Phone",
          controller: phoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Insert phone number";
            }
            return null;
          },
        ),
      ],
    );
  }
}
