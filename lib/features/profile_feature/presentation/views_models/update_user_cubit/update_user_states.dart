import 'package:graduation_project/features/profile_feature/data/models/update_profile_response_model.dart';

abstract class UpdateUserStates {}

class UpdateUserInitialState extends UpdateUserStates {}

class UpdateUserLoadingState extends UpdateUserStates {}

class UpdateUserSuccessState extends UpdateUserStates {
  final UpdateProfileResponseModel userModel;
  UpdateUserSuccessState({required this.userModel});
}

class UpdateUserErrorState extends UpdateUserStates {
  final String errorMessage;
  UpdateUserErrorState({required this.errorMessage});
}
