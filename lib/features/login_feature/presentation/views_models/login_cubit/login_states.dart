import 'package:graduation_project_new_version/features/signup_feature/data/models/sign_up_response.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final SignUpResponse model;
  LoginSuccess(this.model);
}

class LoginError extends LoginStates {
  final String error;
  LoginError(this.error);
}
