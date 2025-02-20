abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {
  final String message;
  SignUpSuccess({required this.message});
}

class SignUpError extends SignUpStates {
  final String error;
  SignUpError(this.error);
}
