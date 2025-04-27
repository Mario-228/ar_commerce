import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/reset_password_repos_implementation.dart';
import 'reset_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  static ResetPasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);
  String otp = '';
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  Future<void> resetPassword({required String email}) async {
    emit(ResetPasswordLoading());
    var result = await ResetPasswordReposImplementation().resetPassword(
        email: email, otp: otp, newPassword: passwordController.text);
    result.fold(
      (error) => emit(ResetPasswordError(error.errorMessage)),
      (data) => emit(ResetPasswordSuccess(data)),
    );
  }
}
