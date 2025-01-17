import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class CustomGenederSelectionWidget extends StatefulWidget {
  const CustomGenederSelectionWidget({super.key});

  @override
  State<CustomGenederSelectionWidget> createState() =>
      _CustomGenederSelectionWidgetState();
}

class _CustomGenederSelectionWidgetState
    extends State<CustomGenederSelectionWidget> {
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Gender:", style: FontStyles.textStyleSemiBold15),
        RadioListTile<String>(
          title: const Text('Male'),
          value: 'Male',
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value ?? "";
            });
          },
          activeColor: AppColors.darkGreen,
        ),
        RadioListTile<String>(
          title: const Text('Female'),
          value: 'Female',
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value ?? "";
            });
          },
          activeColor: AppColors.darkGreen,
        ),
      ],
    );
  }
}
