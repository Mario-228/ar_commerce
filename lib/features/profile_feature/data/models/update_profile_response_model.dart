import 'package:graduation_project/features/profile_feature/data/models/profile_user_model.dart';
import 'package:graduation_project/features/profile_feature/data/repos/profile_repo/profile_constants.dart';

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
