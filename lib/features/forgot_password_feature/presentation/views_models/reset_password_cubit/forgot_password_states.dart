abstract class ForgotPasswordStates {}

class ForgotPasswordInatial extends ForgotPasswordStates {}

class ForgotPasswordLoading extends ForgotPasswordStates {}

class ForgotPasswordSuccess extends ForgotPasswordStates {
  final String message;

  ForgotPasswordSuccess({required this.message});
}

class ForgotPasswordError extends ForgotPasswordStates {
  final String errorMessage;

  ForgotPasswordError({required this.errorMessage});
}
