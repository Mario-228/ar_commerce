import 'package:flutter/material.dart';

import '../../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../../core/utils/font_styles/font_styles.dart';

class AddAddressViewFooter extends StatefulWidget {
  const AddAddressViewFooter({super.key});

  @override
  State<AddAddressViewFooter> createState() => _AddAddressViewFooterState();
}

class _AddAddressViewFooterState extends State<AddAddressViewFooter> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
          activeColor: AppColors.darkGreen,
          checkColor: AppColors.white,
        ),
        const Text(
          "Use as the shipping address",
          style: FontStyles.textStyleRegularDarkGrey14,
        ),
      ],
    );
  }
}
