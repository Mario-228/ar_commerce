abstract class LogoutUserStates {}

class LogoutUserInitialState extends LogoutUserStates {}

class LogoutUserLoadingState extends LogoutUserStates {}

class LogoutUserSuccessState extends LogoutUserStates {
  final String successMessage;
  LogoutUserSuccessState({required this.successMessage});
}

class LogoutUserErrorState extends LogoutUserStates {
  final String errorMessage;
  LogoutUserErrorState({required this.errorMessage});
}
