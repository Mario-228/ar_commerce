import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/features/login_feature/presentation/views_models/login_cubit/login_cubit.dart';
import '../../../../../core/widgets/custom_header_widget.dart';
import '../../views_models/change_visibility_cubit/change_visibility_cubit.dart';
import 'custom_footer_widget_login_bloc_builder.dart';
import 'forget_password_widget.dart';
import 'login_text_form_field_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: LoginCubit.get(context).loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              CustomHeaderWidget(
                title: AppLocalizations.of(context)!.welcomeBack,
                subtitle: AppLocalizations.of(context)!.loginToAccount,
              ),
              const SizedBox(height: 30.0),
              BlocProvider(
                  create: (context) => ChangeVisibilityCubit(),
                  child: const LoginTextFormFieldSection()),
              const SizedBox(height: 12.0),
              const ForgetPasswordWidget(),
              const SizedBox(height: 35.0),
              CustomFooterWidgetLoginBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
