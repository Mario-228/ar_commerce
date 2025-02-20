import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/login_repo_implementations.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await LoginRepoImplementations()
        .login(email: email, password: password);
    result.fold(
      (error) => emit(LoginError(error.errorMessage)),
      (data) => emit(LoginSuccess(data)),
    );
  }
}
