import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class ProductDelivery extends StatelessWidget {
  const ProductDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Dilivery: ",
          style: FontStyles.textStyleBold13,
        ),
        Text(
          "15 days after payment confirmation",
          style: FontStyles.textStyleRegularGrey14,
        ),
      ],
    );
  }
}
