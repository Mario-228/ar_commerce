import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project_new_version/features/signup_feature/presentation/views_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:radio_group_v2/widgets/views/radio_group.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupGenderSection extends StatelessWidget {
  const SignupGenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.selectGender,
            style: FontStyles.textStyleBold22),
        RadioGroup(
          values: [
            AppLocalizations.of(context)!.male,
            AppLocalizations.of(context)!.female,
          ],
          controller: SignUpCubit.get(context).genderController,
        ),
      ],
    );
  }
}
