import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/features/profile_feature/presentation/views_models/update_user_cubit/update_user_cubit.dart';

class CustomGenederSelectionWidget extends StatefulWidget {
  const CustomGenederSelectionWidget({super.key});
  static String gender = "";
  @override
  State<CustomGenederSelectionWidget> createState() =>
      _CustomGenederSelectionWidgetState();
}

class _CustomGenederSelectionWidgetState
    extends State<CustomGenederSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Gender:", style: FontStyles.textStyleSemiBold15),
        RadioListTile<String>(
          title: const Text('male'),
          value: 'male',
          groupValue: UpdateUserCubit.get(context).userProfileModel.gender,
          onChanged: (value) {
            setState(() {
              UpdateUserCubit.get(context).userProfileModel.gender =
                  value ?? "";
            });
          },
          activeColor: AppColors.darkGreen,
        ),
        RadioListTile<String>(
          title: const Text('female'),
          value: 'female',
          groupValue: UpdateUserCubit.get(context).userProfileModel.gender,
          onChanged: (value) {
            setState(() {
              UpdateUserCubit.get(context).userProfileModel.gender =
                  value ?? "";
            });
          },
          activeColor: AppColors.darkGreen,
        ),
      ],
    );
  }
}
