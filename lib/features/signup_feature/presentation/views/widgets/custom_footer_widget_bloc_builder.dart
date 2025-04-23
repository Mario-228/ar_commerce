import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../../../core/utils/cache_helper/cache_helper_keys.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_footer_widget.dart';
import '../../../data/repo/sign_up_repo_implementation.dart';
import '../../views_models/sign_up_cubit/sign_up_cubit.dart';
import '../../views_models/sign_up_cubit/sign_up_states.dart';
import 'signup_view_body.dart';

class CustomFooterWidgetBlocBuilder extends StatelessWidget {
  const CustomFooterWidgetBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpError) {
          showSnackBar(context, state.error);
        } else if (state is SignUpSuccess) {
          onSuccess(context);
          clearSignUpFields(context);
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomFooterWidget(
            buttonTitle: "Sign Up",
            footerText: "Already have an account? ",
            footerLinkText: "Login Here",
            onPressedFooterText: () =>
                GoRouter.of(context).push(AppRouters.kLoginView),
            onPressedButton: () async {
              if (SignUpCubit.get(context)
                  .signUpFormKey
                  .currentState!
                  .validate()) {
                if (SignUpCubit.get(context).genderController.value == null) {
                  showSnackBar(context, "Select your gender");
                  return;
                }
                await SignUpCubit.get(context).signUp();
              }
            },
          );
        }
      },
    );
  }

  Future<void> onSuccess(BuildContext context) async {
    var user = SignUpCubit.get(context).user;
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
