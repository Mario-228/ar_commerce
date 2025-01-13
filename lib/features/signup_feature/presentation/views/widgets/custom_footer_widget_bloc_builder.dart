// import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/core/utils/app_routers/app_routers.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper.dart';
import 'package:graduation_project/core/utils/cache_helper/cache_helper_keys.dart';
import 'package:graduation_project/core/utils/functions/show_snack_bar.dart';
import 'package:graduation_project/core/widgets/custom_footer_widget.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_user_model.dart';
import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo_implementation.dart';
// import 'package:graduation_project/features/signup_feature/data/models/user_model.dart';
// import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo_implementation.dart';
import 'package:graduation_project/features/signup_feature/presentation/views/widgets/signup_view_body.dart';
import 'package:graduation_project/features/signup_feature/presentation/views_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:graduation_project/features/signup_feature/presentation/views_models/sign_up_cubit/sign_up_states.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

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
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpError) {
          showSnackBar(context, state.error);
        } else if (state is SignUpSuccess) {
          onSuccess(context);
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
                SignUpUserModel user = SignUpUserModel(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
                await SignUpCubit.get(context).signUp(user);
              }
            },
          );
        }
      },
    );
  }
// var response = await SignUpRepoImplementation()
//     .insertUserIntoDatabase(getUserDataFromSignUp(user));
// response.fold(
//     (error) =>
//         showSnackBar(context, "Try with another Credentials"),
//     (value) => onSuccess(context));
//   UserModel getUserDataFromSignUp(SignUpUserModel user) {
//     return UserModel(
//       id: Supabase.instance.client.auth.currentUser!.id,
//       email: user.email,
//       name: user.name,
//       phoneNumber: "",
//       pictureUrl: AppImages.assetsImagesUserImage,
//       password: Crypt.sha256(user.password).toString(),
//     );
//   }
// }

  Future<void> onSuccess(BuildContext context) async {
    showSnackBar(context, "Check your email to verify your account");
    await CacheHelper.saveData<bool>(CacheHelperKeys.isVerified, false);
    await CacheHelper.saveData<String>(
        CacheHelperKeys.userEmail, emailController.text);
    String email = "";
    await CacheHelper.getData<String>(CacheHelperKeys.userEmail).then((value) {
      print(value.toString());
      email = value!;
    });
    var response =
        await SignUpRepoImplementation().sendVerificationEmail(email);
    response.fold(
        (error) =>
            showSnackBar(context, "Something went wrong please try again..."),
        (value) =>
            GoRouter.of(context).push(AppRouters.kEmailVerificationView));
  }
}
