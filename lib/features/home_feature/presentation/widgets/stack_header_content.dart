import 'package:flutter/material.dart';

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
          const Text("Set up your space easily",
              style: FontStyles.textStyleBold19),
          const SizedBox(height: 25.0),
        ],
      ),
    );
  }
}
