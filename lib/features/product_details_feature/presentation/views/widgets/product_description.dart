import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur velit at massa vehicula, quis fringilla urna gravida.",
        style: FontStyles.textStyleMeduim13.copyWith(color: AppColors.grey),
        softWrap: true,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
