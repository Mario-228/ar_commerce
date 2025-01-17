import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

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
          groupValue: CustomGenederSelectionWidget.gender,
          onChanged: (value) {
            setState(() {
              CustomGenederSelectionWidget.gender = value ?? "";
            });
          },
          activeColor: AppColors.darkGreen,
        ),
        RadioListTile<String>(
          title: const Text('female'),
          value: 'female',
          groupValue: CustomGenederSelectionWidget.gender,
          onChanged: (value) {
            setState(() {
              CustomGenederSelectionWidget.gender = value ?? "";
            });
          },
          activeColor: AppColors.darkGreen,
        ),
      ],
    );
  }
}
