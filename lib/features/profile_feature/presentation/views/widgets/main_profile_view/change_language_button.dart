import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation_project_new_version/core/localiztion/locale_cubit.dart';
import 'package:graduation_project_new_version/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/main_profile_view/profile_custom_button.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileCustomButton(
      radius: 20.0,
      height: 60.0,
      width: 300.0,
      text: AppLocalizations.of(context)!.changeLanguage,
      color: AppColors.greyShade500,
      icon: Icons.language,
      onPressed: () {
        LocaleCubit.get(context).toggleLocale();
        // showSnackBar(context, LocaleCubit.languageCode);
      },
      textColor: AppColors.lightLimeGreen,
    );
  }
}
