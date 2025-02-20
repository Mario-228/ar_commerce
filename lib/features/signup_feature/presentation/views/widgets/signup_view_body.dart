import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_header_widget.dart';
import 'custom_footer_widget_bloc_builder.dart';
import 'signup_text_form_field_section.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});
  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Form(
          key: signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              const CustomHeaderWidget(
                title: "Create Account",
                subtitle: "Enter your details for a new account",
              ),
              const SizedBox(height: 30.0),
              SignupTextFormFieldSection(
                  emailController: emailController,
                  nameController: nameController,
                  passwordController: passwordController),
              const SizedBox(height: 20.0),
              CustomFooterWidgetBlocBuilder(
                  signUpFormKey: signUpFormKey,
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController),
            ],
          ),
        ),
      ),
    );
  }
}

void clearSignUpFields() {
  SignupViewBody.nameController.clear();
  SignupViewBody.emailController.clear();
  SignupViewBody.passwordController.clear();
}

// const ListTile(
//   leading: Icon(Icons.circle_outlined),
//   title: Text(
//     "I accept the Terms of Service & Privacy Policy",
//     style: FontStyles.textStyleMedium12,
//   ),
// ),
