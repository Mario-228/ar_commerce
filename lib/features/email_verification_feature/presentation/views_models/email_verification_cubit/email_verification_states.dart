abstract class EmailVerificationStates {}

class EmailVerificationInitial extends EmailVerificationStates {}

class EmailVerificationLoading extends EmailVerificationStates {}

class EmailVerificationSuccess extends EmailVerificationStates {
  final String message;
  EmailVerificationSuccess(this.message);
}

class EmailVerificationError extends EmailVerificationStates {
  final String errorMessage;
  EmailVerificationError(this.errorMessage);
}
