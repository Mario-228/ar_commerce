import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        Text(
          AppLocalizations.of(context)!.useAsTheShippingAddress,
          style: FontStyles.textStyleRegularDarkGrey14,
        ),
      ],
    );
  }
}
