import 'package:graduation_project/features/signup_feature/data/models/sign_up_response.dart';

abstract class UpdateUserStates {}

class UpdateUserInitialState extends UpdateUserStates {}

class UpdateUserLoadingState extends UpdateUserStates {}

class UpdateUserSuccessState extends UpdateUserStates {
  final SignUpResponse userModel;
  UpdateUserSuccessState({required this.userModel});
}

class UpdateUserErrorState extends UpdateUserStates {
  final String errorMessage;
  UpdateUserErrorState({required this.errorMessage});
}
