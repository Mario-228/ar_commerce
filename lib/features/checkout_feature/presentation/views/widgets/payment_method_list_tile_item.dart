import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors/app_colors.dart';

class PaymentMethodListTileItem extends StatelessWidget {
  const PaymentMethodListTileItem({
    super.key,
    required this.onTap,
    required this.title,
  });
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading:
                Icon(Icons.credit_card, color: AppColors.darkGreen, size: 28),
            title: Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ),
        ),
      ),
    );
  }
}
