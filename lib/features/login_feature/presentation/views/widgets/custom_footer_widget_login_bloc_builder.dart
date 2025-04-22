import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../../../core/utils/cache_helper/cache_helper_keys.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_footer_widget.dart';
import '../../views_models/login_cubit/login_cubit.dart';
import '../../views_models/login_cubit/login_states.dart';
import 'login_text_form_field_section.dart';

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
          await onSuccessLogin(context, state);
        } else if (state is LoginError) {
          onErrorLogin(state, context);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomFooterWidget(
            onPressedButton: () async {
              if (loginFormKey.currentState!.validate()) {
                CacheHelper.saveData<String>(CacheHelperKeys.userEmail,
                        LoginTextFormFieldSection.emailController.text)
                    .then(
                  (value) {
                    if (context.mounted) {
                      LoginCubit.get(context).login(
                        LoginTextFormFieldSection.emailController.text,
                        LoginTextFormFieldSection.passwordController.text,
                      );
                    }
                  },
                );
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

  void onErrorLogin(LoginError state, BuildContext context) {
    if (state.error.contains("must do Email Verification")) {
      GoRouter.of(context).push(AppRouters.kEmailVerificationView);
      showSnackBar(context, state.error);
    } else {
      showSnackBar(context, state.error);
    }
  }

  Future<void> onSuccessLogin(BuildContext context, LoginSuccess state) async {
    GoRouter.of(context).pushReplacement(AppRouters.kHomeView);
    showSnackBar(context, "Login successfully");
    await updateUserToken(state);
  }

  Future<void> updateUserToken(LoginSuccess state) async {
    await CacheHelper.saveData<String>(
        CacheHelperKeys.tokenKey, state.model.token);
    userToken = state.model.token;
    // print(userToken);
    LoginTextFormFieldSection.clearFields();
  }
}
