import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_footer_widget.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_user_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpStates>(
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
              if (state is SignUpError) {
                showSnackBar(context, state.error);
              } else {
                if (signUpFormKey.currentState!.validate()) {
                  SignUpUserModel user = SignUpUserModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  await SignUpCubit.get(context).signUp(user).then((value) {
                    clearSignUpFields();
                    showSnackBar(context, "Account created successfully");
                  });
                }
              }
            },
          );
        }
      },
    );
  }
}
/*
// Supabase.instance.client
//     .from(SignUpRepoConstants.usersEndPoint)
//     .insert({
//   SignUpRepoConstants.id:
//       Supabase.instance.client.auth.currentUser!.id,
//   SignUpRepoConstants.name: nameController.text,
//   SignUpRepoConstants.email: emailController.text,
//   SignUpRepoConstants.emailConfirmed: false,
//   SignUpRepoConstants.phone: "",
//   SignUpRepoConstants.pictureUrl:
//       "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?t=st=1733863368~exp=1733866968~hmac=dcf753cc48215353e01269e8d6aaf27adfa1e7eff7d23173fd74e6dda73b5dd2&w=740"
// }).then((value) {
//   print("inserted => $value");
// });

 */