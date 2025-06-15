import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => GoRouter.of(context).push(AppRouters.kForgotPasswordView),
        child: Text(
          AppLocalizations.of(context)!.forgotPassword,
          style: FontStyles.textStyleMedium12
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
