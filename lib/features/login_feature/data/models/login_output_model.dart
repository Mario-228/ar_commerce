import 'package:graduation_project_new_version/features/profile_feature/data/models/profile_user_model.dart';

class LoginOutputModel {
  final String token;
  ProfileUserModel user;

  LoginOutputModel({required this.token, required this.user});

  static LoginOutputModel fromJson(Map<String, dynamic> json) =>
      LoginOutputModel(
        token: json['token'],
        user: ProfileUserModel.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {'token': token, 'user': user.toJson()};
}
