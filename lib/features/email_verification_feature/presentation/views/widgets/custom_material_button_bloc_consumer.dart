import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../../../core/utils/cache_helper/cache_helper_keys.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../../../core/widgets/custom_material_button.dart';
import '../../views_models/email_verification_cubit/email_verification_cubit.dart';
import '../../views_models/email_verification_cubit/email_verification_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomMaterialButtonBlocConsumer extends StatelessWidget {
  const CustomMaterialButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerificationCubit, EmailVerificationStates>(
      listener: (context, state) async {
        if (state is EmailVerificationSuccess) {
          showSnackBar(
              context, AppLocalizations.of(context)!.emailVerificationSuccess);
          GoRouter.of(context).push(AppRouters.kLoginView);
          await updateVerified();
        } else if (state is EmailVerificationError) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is EmailVerificationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CustomMaterialButton(
            text: 'Confirm',
            onPressed: () async {
              if (EmailVerificationCubit.get(context).otp.length == 6) {
                EmailVerificationCubit.get(context).verificationEmail();
              } else {
                showSnackBar(
                    context, AppLocalizations.of(context)!.enterValidOTP);
              }
            },
            color: AppColors.darkGreen,
            textColor: AppColors.white,
          );
        }
      },
    );
  }

  Future<void> updateVerified() async {
    await CacheHelper.saveData<bool>(CacheHelperKeys.isVerified, true);
    isVerified = true;
  }
}
