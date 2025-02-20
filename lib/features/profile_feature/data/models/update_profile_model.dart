import 'dart:io';
import '../repos/update_user_repo/update_user_constants.dart';

class UpdateProfileModel {
  String name;
  String phone;
  File image;
  String gender;

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
