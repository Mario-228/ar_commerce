import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/utils/cache_helper/cache_helper.dart';
// import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';
import '../../../../../../constants.dart';
import '../../../../../../core/utils/functions/show_snack_bar.dart';
import '../../../views_models/get_user_cubit/get_user_cubit.dart';
import '../../../views_models/get_user_cubit/get_user_states.dart';
import 'user_profile_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserProfileHeaderBlocBuilder extends StatelessWidget {
  const UserProfileHeaderBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserCubit, GetUserStates>(
      listener: (context, state) {
        if (state is GetUserErrorState) {
          showSnackBar(
              context, AppLocalizations.of(context)!.somethingWentWrongReload);
        }
      },
      builder: (context, state) {
        if (state is GetUserSuccessState) {
          userModel = state.userModel;
          return UserPofileHeader(
            userModel: state.userModel,
          );
        } else if (state is GetUserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          defaultUser.userModel = CacheHelper.getUserData().user;
          return UserPofileHeader(
            userModel: defaultUser,
          );
        }
      },
    );
  }
}
