import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../../core/utils/font_styles/font_styles.dart';

class ContactContainer extends StatelessWidget {
  const ContactContainer({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.grey),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.darkGreen, size: 30),
            SizedBox(width: 8),
            Text(
              title,
              style: FontStyles.textStyleRegular16,
            ),
          ],
        ),
      ),
    );
  }
}
