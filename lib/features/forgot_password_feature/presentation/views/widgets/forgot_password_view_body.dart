import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:graduation_project/core/widgets/custom_header_widget.dart';
import 'package:graduation_project/core/widgets/custom_material_button.dart';
import 'package:graduation_project/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/password_reset_feature/presentation/views/password_reset_view.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            const CustomHeaderWidget(
                title: "Forgot Password",
                subtitle: "Login to your minifurs account"),
            const SizedBox(height: 40.0),
            CustomTextFormField(
                type: TextInputType.emailAddress,
                labelText: "Enter Email Address",
                controller: TextEditingController()),
            const SizedBox(height: 35.0),
            CustomMaterialButton(
              text: "Send Email",
              color: AppColors.darkGreen,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PasswordResetView(),
                  ),
                );
              },
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
