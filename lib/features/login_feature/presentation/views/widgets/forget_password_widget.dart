import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

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
          "Forgot Password?",
          style: FontStyles.textStyleMedium12
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
