import 'dart:io';
import '../repos/update_user_repo/update_user_constants.dart';

class UpdateProfileModel {
  String? name;
  String? phone;
  File? image;
  String? gender;

  UpdateProfileModel({this.name, this.phone, this.image, this.gender});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (name != null) data[UpdateUserConstants.nameKey] = name;
    if (phone != null) data[UpdateUserConstants.phoneKey] = phone;
    if (image != null) data[UpdateUserConstants.imageKey] = image;
    if (gender != null) data[UpdateUserConstants.genderKey] = gender;

    return data;
  }
}
