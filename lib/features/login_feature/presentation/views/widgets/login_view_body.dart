import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_header_widget.dart';
import '../../views_models/change_visibility_cubit/change_visibility_cubit.dart';
import 'custom_footer_widget_login_bloc_builder.dart';
import 'forget_password_widget.dart';
import 'login_text_form_field_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              const CustomHeaderWidget(
                title: 'Welcome Back',
                subtitle: 'Login to your minifurs account',
              ),
              const SizedBox(height: 30.0),
              BlocProvider(
                  create: (context) => ChangeVisibilityCubit(),
                  child: const LoginTextFormFieldSection()),
              const SizedBox(height: 12.0),
              const ForgetPasswordWidget(),
              const SizedBox(height: 35.0),
              CustomFooterWidgetLoginBlocBuilder(loginFormKey: loginFormKey),
            ],
          ),
        ),
      ),
    );
  }
}
