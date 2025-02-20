import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../views_models/change_visibility_cubit/change_visibility_cubit.dart';
import '../../views_models/change_visibility_cubit/change_visibility_states.dart';

class CustomPasswordFieldBlocBuilder extends StatelessWidget {
  const CustomPasswordFieldBlocBuilder({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeVisibilityCubit, ChangeVisibilityStates>(
        builder: (context, state) {
      return CustomTextFormField(
        isPassword: ChangeVisibilityCubit.get(context).isVisible,
        type: TextInputType.emailAddress,
        labelText: 'Password',
        controller: passwordController,
        icon: ChangeVisibilityCubit.get(context).eye,
        onPressed: ChangeVisibilityCubit.get(context).changeLoginVisibility,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your Password';
          }
          return null;
        },
      );
    });
  }
}
