import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/font_styles/font_styles.dart';

class StackHeaderContent extends StatelessWidget {
  const StackHeaderContent({
    super.key,
  });
  static final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.setupYourSpace,
              style: FontStyles.textStyleBold19),
          const SizedBox(height: 25.0),
        ],
      ),
    );
  }
}
