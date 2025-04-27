import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/forgot_password_repo_implementation.dart';
import 'forgot_password_states.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStates> {
  ForgotPasswordCubit() : super(ForgotPasswordInatial());

  static ForgotPasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  Future<void> emailRestoration() async {
    emit(ForgotPasswordLoading());
    var result = await ForgotPasswordRepoImplementation()
        .forgotPassword(emailController.text);
    result.fold(
        (error) => emit(ForgotPasswordError(errorMessage: error.errorMessage)),
        (data) => emit(ForgotPasswordSuccess(message: data)));
  }
}
