import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/features/reset_password_feature/presentation/views_models/reset_password_cubit/reset_password_cubit.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../views_models/reset_password_cubit/reset_password_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RestoreAccountBlocConsumerButton extends StatelessWidget {
  const RestoreAccountBlocConsumerButton({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showSnackBar(
              context, AppLocalizations.of(context)!.passwordResetSuccessfully);
          GoRouter.of(context).push(AppRouters.kLoginView);
        } else if (state is ResetPasswordError) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is ResetPasswordLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.lightLimeGreen),
          );
        } else {
          return CustomMaterialButton(
            text: AppLocalizations.of(context)!.restoreAccount,
            color: AppColors.darkGreen,
            onPressed: () async {
              if (ResetPasswordCubit.get(context)
                  .resetPasswordFormKey
                  .currentState!
                  .validate()) {
                if (ResetPasswordCubit.get(context).otp.length == 6) {
                  await ResetPasswordCubit.get(context)
                      .resetPassword(email: email);
                } else {
                  showSnackBar(
                      context, AppLocalizations.of(context)!.enterValidOTP);
                }
              }
            },
            textColor: AppColors.white,
          );
        }
      },
    );
  }
}
