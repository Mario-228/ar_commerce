import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';
import 'package:graduation_project/core/widgets/custom_footer_widget.dart';
import 'package:graduation_project/core/widgets/custom_header_widget.dart';
import 'package:graduation_project/features/signup_feature/presentation/views/widgets/signup_text_form_field_section.dart';

class SignupViewBody extends StatelessWidget {
  SignupViewBody({super.key});
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            const CustomHeaderWidget(
              title: "Create Account",
              subtitle: "Enter your details for a new account",
            ),
            const SizedBox(height: 30.0),
            SignupTextFormFieldSection(passwordController: passwordController),
            const SizedBox(height: 20.0),
            const ListTile(
              leading: Icon(Icons.circle_outlined),
              title: Text(
                "I accept the Terms of Service & Privacy Policy",
                style: FontStyles.textStyleMedium12,
              ),
            ),
            const SizedBox(height: 30.0),
            CustomFooterWidget(
              buttonTitle: "Sign Up",
              footerText: "Already have an account? ",
              footerLinkText: "Login Here",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
