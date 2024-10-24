import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class ProductDelivery extends StatelessWidget {
  const ProductDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "Dilivery: ", style: FontStyles.textStyleBold13),
          TextSpan(
            text: "15 days after payment confirmation",
            style:
                FontStyles.textStyleRegular14.copyWith(color: AppColors.grey),
          )
        ],
      ),
    );
  }
}
