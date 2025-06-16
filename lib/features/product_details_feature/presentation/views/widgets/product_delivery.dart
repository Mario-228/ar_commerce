import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class ProductDelivery extends StatelessWidget {
  const ProductDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.delivery,
          style: FontStyles.textStyleBold13,
        ),
        Text(
          AppLocalizations.of(context)!.deliveryDays,
          style: FontStyles.textStyleRegularGrey14,
        ),
      ],
    );
  }
}
