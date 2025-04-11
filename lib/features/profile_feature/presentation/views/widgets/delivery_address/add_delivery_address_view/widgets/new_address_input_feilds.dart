import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/widgets/custom_text_form_field.dart';

class NewAddressInputFeilds extends StatelessWidget {
  const NewAddressInputFeilds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.name,
          labelText: "Full Name",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          type: TextInputType.emailAddress,
          labelText: "Email",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          type: TextInputType.text,
          labelText: "Phone Number",
          controller: TextEditingController(),
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          type: TextInputType.streetAddress,
          labelText: "Address",
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
