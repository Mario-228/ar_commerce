import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/reset_password_feature/data/reset_password_repos_implementation.dart';
import 'package:graduation_project/features/reset_password_feature/presentation/views_models/reset_password_cubit/reset_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  static ResetPasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);
  Future<void> resetPassword(String email, String otp, String password) async {
    emit(ResetPasswordLoading());
    var result = await ResetPasswordReposImplementation()
        .resetPassword(email: email, otp: otp, newPassword: password);
    result.fold(
      (error) => emit(ResetPasswordError(error.errorMessage)),
      (data) => emit(ResetPasswordSuccess(data)),
    );
  }
}
