import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../../core/utils/app_routers/app_routers.dart';
import '../../../../../../core/utils/cache_helper/cache_helper.dart';
import '../../../../../../core/utils/cache_helper/cache_helper_keys.dart';
import '../../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../views_models/logout_user_cubit/logout_user_cubit.dart';
import '../../../views_models/logout_user_cubit/logout_user_states.dart';
import 'profile_custom_button.dart';

class ProfileCustomButtonBlocConsumer extends StatelessWidget {
  const ProfileCustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutUserCubit(),
      child: BlocConsumer<LogoutUserCubit, LogoutUserStates>(
          listener: (context, state) {
        if (state is LogoutUserSuccessState) {
          logoutSuccessfully(context);
        } else if (state is LogoutUserErrorState) {
          showSnackBar(context, state.errorMessage);
        }
      }, builder: (context, states) {
        if (states is LogoutUserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.lightLimeGreen),
          );
        } else {
          return ProfileCustomButton(
            radius: 20.0,
            height: 60.0,
            width: 300.0,
            text: "Logout",
            color: AppColors.greyShade500,
            onPressed: () async {
              await LogoutUserCubit.get(context).logoutUser();
            },
            textColor: AppColors.lightLimeGreen,
          );
        }
      }),
    );
  }

  Future<void> logoutSuccessfully(BuildContext context) async {
    showSnackBar(context, "Logout successfully");
    GoRouter.of(context).pushReplacement(AppRouters.kLoginView);
    await CacheHelper.saveData<String>(CacheHelperKeys.tokenKey, "");
    userToken = ""; //must change the token variable by LoginOutputModel obeject
  }
}
