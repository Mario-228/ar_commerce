import 'package:flutter/material.dart';
import '../../../../core/utils/font_styles/font_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomLatestRelease extends StatelessWidget {
  const CustomLatestRelease({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.latestRelease,
          style: FontStyles.textStyleSemiBold20,
        ),
        // GestureDetector(
        //   onTap: () {},
        //   child: Row(
        //     children: [
        //       // Text(
        //       //   "See All",
        //       //   style: FontStyles.textStyleRegular12
        //       //       .copyWith(color: AppColors.glodenOrange),
        //       // ),
        //       const SizedBox(width: 8.0),
        //       const Icon(
        //         Icons.arrow_forward,
        //         color: AppColors.glodenOrange,
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
