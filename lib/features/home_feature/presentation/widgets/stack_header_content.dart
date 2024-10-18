import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

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
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              fillColor: AppColors.white,
              filled: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(11.0)),
              ),
              hintText: "Search Item",
              hintStyle: FontStyles.textStyleLight10,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
