abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final bool isLogin;
  LoginSuccess(this.isLogin);
}

class LoginError extends LoginStates {
  final String error;
  LoginError(this.error);
}
