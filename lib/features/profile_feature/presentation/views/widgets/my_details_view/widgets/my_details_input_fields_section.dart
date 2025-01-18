import 'package:flutter/material.dart';
// import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/update_user_cubit/update_user_cubit.dart';

class MyDetailsInputFieldsSection extends StatelessWidget {
  const MyDetailsInputFieldsSection({
    super.key,
    // required this.nameController,
    // required this.phoneController,
    required this.userModel,
  });
  final UserModel userModel;
  static TextEditingController nameControllerUserUpdate =
      TextEditingController();
  static TextEditingController phoneControllerUserUpdate =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameControllerUserUpdate.text = userModel.userModel.name;
    phoneControllerUserUpdate.text = userModel.userModel.phone;
    return Column(
      children: [
        CustomTextFormField(
          type: TextInputType.name,
          labelText: "Name",
          controller: nameControllerUserUpdate,
          icon: Icons.person,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Insert name";
            } else {
              UpdateUserCubit.get(context).userProfileModel.name = value;
              return null;
            }
          },
        ),
        const SizedBox(height: 10.0),
        CustomTextFormField(
          icon: Icons.phone,
          type: TextInputType.phone,
          labelText: "Phone",
          controller: phoneControllerUserUpdate,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Insert phone number";
            } else {
              UpdateUserCubit.get(context).userProfileModel.phone = value;
              return null;
            }
          },
        ),
      ],
    );
  }
}
