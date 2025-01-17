import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';

class UpdateUserInfoButtonBlocBuilder extends StatelessWidget {
  const UpdateUserInfoButtonBlocBuilder({
    super.key,
    required this.myDetailsFormKey,
  });

  final GlobalKey<FormState> myDetailsFormKey;

  @override
  Widget build(BuildContext context) {
    return CustomMaterialButton(
      text: "Update",
      color: AppColors.darkGreen,
      onPressed: () {
        if (myDetailsFormKey.currentState!.validate()) {}
      },
    );
  }
}
