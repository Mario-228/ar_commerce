import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/login_repo_implementations.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future<void> login() async {
    emit(LoginLoading());
    var result = await LoginRepoImplementations()
        .login(email: emailController.text, password: passwordController.text);
    result.fold(
      (error) => emit(LoginError(error.errorMessage)),
      (data) => emit(LoginSuccess(data)),
    );
  }
}
