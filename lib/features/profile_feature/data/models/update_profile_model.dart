import 'dart:io';
import 'package:graduation_project/features/profile_feature/data/repos/update_user_repo/update_user_constants.dart';

class UpdateProfileModel {
  final String name;
  final String phone;
  final File image;
  final String gender;

  UpdateProfileModel(
      {required this.name,
      required this.phone,
      required this.image,
      required this.gender});

  Map<String, dynamic> toJson() => {
        UpdateUserConstants.nameKey: name,
        UpdateUserConstants.phoneKey: phone,
        UpdateUserConstants.imageKey: image,
        UpdateUserConstants.genderKey: gender,
      };
}
