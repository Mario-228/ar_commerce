import 'package:graduation_project_new_version/features/login_feature/data/models/login_output_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final LoginOutputModel model;
  LoginSuccess(this.model);
}

class LoginError extends LoginStates {
  final String error;
  LoginError(this.error);
}
