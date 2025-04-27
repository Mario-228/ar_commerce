import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/signup_feature/presentation/views_models/sign_up_cubit/sign_up_cubit.dart';
import '../../../../../core/widgets/custom_header_widget.dart';
import 'custom_footer_widget_bloc_builder.dart';
import 'signup_text_form_field_section.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: SignUpCubit.get(context).signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              const CustomHeaderWidget(
                title: "Create Account",
                subtitle: "Enter your details for a new account",
              ),
              const SizedBox(height: 30.0),
              SignupTextFormFieldSection(),
              const SizedBox(height: 20.0),
              CustomFooterWidgetBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}

void clearSignUpFields(BuildContext context) {
  SignUpCubit.get(context).nameController.clear();
  SignUpCubit.get(context).emailController.clear();
  SignUpCubit.get(context).passwordController.clear();
}

// const ListTile(
//   leading: Icon(Icons.circle_outlined),
//   title: Text(
//     "I accept the Terms of Service & Privacy Policy",
//     style: FontStyles.textStyleMedium12,
//   ),
// ),
