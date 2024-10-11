import 'package:flutter/material.dart';
import 'package:graduation_project/features/login_feature/presentation/views/widgets/forget_password_widget.dart';
import 'package:graduation_project/features/login_feature/presentation/views/widgets/login_footer_widget.dart';
import 'package:graduation_project/features/login_feature/presentation/views/widgets/login_header_widget.dart';
import 'package:graduation_project/features/login_feature/presentation/views/widgets/login_text_form_field_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.0),
          LoginHeaderWidget(),
          SizedBox(height: 30.0),
          LoginTextFormFieldSection(),
          SizedBox(height: 12.0),
          ForgetPasswordWidget(),
          SizedBox(height: 35.0),
          LoginFooterWidget(),
        ],
      ),
    );
  }
}
