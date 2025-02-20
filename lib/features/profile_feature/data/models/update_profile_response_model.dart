import '../repos/profile_repo/profile_constants.dart';
import 'profile_user_model.dart';

class UpdateProfileResponseModel {
  final String imageUrl;
  final ProfileUserModel user;
  UpdateProfileResponseModel({
    required this.imageUrl,
    required this.user,
  });

  static UpdateProfileResponseModel fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseModel(
      imageUrl: json[ProfileConstants.imageUrl] ?? "",
      user: ProfileUserModel.fromJson(json[ProfileConstants.user]),
    );
  }
}
