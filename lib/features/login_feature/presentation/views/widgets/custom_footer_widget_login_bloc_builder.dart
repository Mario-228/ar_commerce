import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper_keys.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_footer_widget.dart';
import 'package:graduation_project/features/login_feature/presentation/views_models/login_cubit/login_cubit.dart';
import 'package:graduation_project/features/login_feature/presentation/views_models/login_cubit/login_states.dart';
import 'package:graduation_project/features/login_feature/presentation/views/widgets/login_text_form_field_section.dart';

class CustomFooterWidgetLoginBlocBuilder extends StatelessWidget {
  const CustomFooterWidgetLoginBlocBuilder({
    super.key,
    required this.loginFormKey,
  });
  final GlobalKey<FormState> loginFormKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRouters.kHomeView);
          showSnackBar(context, "Login successfully");
          await updateUserToken(state);
        } else if (state is LoginError) {
          showSnackBar(context, "the provided credentials are incorrect");
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomFooterWidget(
            onPressedButton: () async {
              if (loginFormKey.currentState!.validate()) {
                await CacheHelper.saveData<String>(CacheHelperKeys.userEmail,
                        LoginTextFormFieldSection.emailController.text)
                    .then((value) {
                  if (isVerified && userEmail.isNotEmpty) {
                    LoginCubit.get(context).login(
                        LoginTextFormFieldSection.emailController.text,
                        LoginTextFormFieldSection.passwordController.text);
                  } else if (!isVerified && userEmail.isNotEmpty) {
                    showSnackBar(context, "please verify your email first");
                    GoRouter.of(context)
                        .push(AppRouters.kEmailVerificationView);
                  } else {
                    showSnackBar(context, "please sign up first");
                    GoRouter.of(context).push(AppRouters.kSignUpView);
                  }
                });
              }
            },
            formKey: loginFormKey,
            buttonTitle: "Login",
            footerText: "Don't have an account? ",
            footerLinkText: "Create Account Here",
            onPressedFooterText: () =>
                GoRouter.of(context).push(AppRouters.kSignUpView),
          );
        }
      },
    );
  }

  Future<void> updateUserToken(LoginSuccess state) async {
    await CacheHelper.saveData<String>(
        CacheHelperKeys.tokenKey, state.model.token);
    userToken = state.model.token;
    print(userToken);
  }
}
