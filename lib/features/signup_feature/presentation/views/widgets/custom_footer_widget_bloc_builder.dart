import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper_keys.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_footer_widget.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_user_model.dart';
import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo_implementation.dart';
import 'package:graduation_project/features/signup_feature/presentation/views/widgets/signup_view_body.dart';
import 'package:graduation_project/features/signup_feature/presentation/views_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:graduation_project/features/signup_feature/presentation/views_models/sign_up_cubit/sign_up_states.dart';

class CustomFooterWidgetBlocBuilder extends StatelessWidget {
  const CustomFooterWidgetBlocBuilder({
    super.key,
    required this.signUpFormKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> signUpFormKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  static late SignUpUserModel user;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpError) {
          showSnackBar(context, state.error);
        } else if (state is SignUpSuccess) {
          onSuccess(context, user);
          clearSignUpFields();
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomFooterWidget(
            formKey: signUpFormKey,
            buttonTitle: "Sign Up",
            footerText: "Already have an account? ",
            footerLinkText: "Login Here",
            onPressedFooterText: () =>
                GoRouter.of(context).push(AppRouters.kLoginView),
            onPressedButton: () async {
              if (signUpFormKey.currentState!.validate()) {
                user = SignUpUserModel(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
                // print(user.toJson());
                await SignUpCubit.get(context).signUp(user);
              }
            },
          );
        }
      },
    );
  }

  Future<void> onSuccess(BuildContext context, SignUpUserModel user) async {
    await CacheHelper.saveData<bool>(CacheHelperKeys.isVerified, false);
    await CacheHelper.saveData<String>(CacheHelperKeys.userEmail, user.email);
    userEmail = user.email;
    var response =
        await SignUpRepoImplementation().sendVerificationEmail(user.email);
    response.fold(
        (error) =>
            showSnackBar(context, "Something went wrong please try again..."),
        (value) {
      GoRouter.of(context).push(AppRouters.kEmailVerificationView);
      showSnackBar(context, "Check your email to verify your account");
    });
  }
}
