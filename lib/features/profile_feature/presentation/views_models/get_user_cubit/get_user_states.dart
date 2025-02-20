import '../../../data/models/profile_user_model.dart';

abstract class GetUserStates {}

class GetUserInitialState extends GetUserStates {}

class GetUserLoadingState extends GetUserStates {}

class GetUserSuccessState extends GetUserStates {
  UserModel userModel;
  GetUserSuccessState({required this.userModel});
}

class GetUserErrorState extends GetUserStates {
  String errorMessage;
  GetUserErrorState({required this.errorMessage});
}
