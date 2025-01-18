import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';

abstract class UpdateUserStates {}

class UpdateUserInitialState extends UpdateUserStates {}

class UpdateUserLoadingState extends UpdateUserStates {}

class UpdateUserSuccessState extends UpdateUserStates {
  final UserModel userModel;
  UpdateUserSuccessState({required this.userModel});
}

class UpdateUserErrorState extends UpdateUserStates {
  final String errorMessage;
  UpdateUserErrorState({required this.errorMessage});
}

class GetUserErrorState extends UpdateUserStates {
  final String errorMessage;
  GetUserErrorState({required this.errorMessage});
}
