abstract class ResetPasswordStates {}

class ResetPasswordInitial extends ResetPasswordStates {}

class ResetPasswordLoading extends ResetPasswordStates {}

class ResetPasswordSuccess extends ResetPasswordStates {
  final String message;
  ResetPasswordSuccess(this.message);
}

class ResetPasswordError extends ResetPasswordStates {
  final String errorMessage;
  ResetPasswordError(this.errorMessage);
}
