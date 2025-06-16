import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/login_feature/presentation/views_models/login_cubit/login_cubit.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../views_models/change_visibility_cubit/change_visibility_cubit.dart';
import '../../views_models/change_visibility_cubit/change_visibility_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomPasswordFieldBlocBuilder extends StatelessWidget {
  const CustomPasswordFieldBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeVisibilityCubit, ChangeVisibilityStates>(
        builder: (context, state) {
      return CustomTextFormField(
        isPassword: ChangeVisibilityCubit.get(context).isVisible,
        type: TextInputType.visiblePassword,
        labelText: AppLocalizations.of(context)!.password,
        controller: LoginCubit.get(context).passwordController,
        icon: ChangeVisibilityCubit.get(context).eye,
        onPressed: ChangeVisibilityCubit.get(context).changeLoginVisibility,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context)!.enterPassword;
          }
          return null;
        },
      );
    });
  }
}
