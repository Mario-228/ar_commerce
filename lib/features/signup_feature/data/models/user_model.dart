import 'package:graduation_project/core/utils/app_images/app_images.dart';
import 'package:graduation_project/features/signup_feature/data/models/sign_up_user_model.dart';
import 'package:graduation_project/features/signup_feature/data/repo/sign_up_repo_constants.dart';

class UserModel extends SignUpUserModel {
  String id;
  String phoneNumber;
  String pictureUrl;
  bool emailConfirmed;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  bool lockoutEnabled;
  int accessFailedCount;
  UserModel({
    required super.name,
    required super.email,
    required super.password,
    required this.id,
    required this.phoneNumber,
    required this.pictureUrl,
    this.emailConfirmed = false,
    this.phoneNumberConfirmed = false,
    this.twoFactorEnabled = false,
    this.lockoutEnabled = false,
    this.accessFailedCount = 0,
  });

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json[SignUpRepoConstants.id],
        name: json[SignUpRepoConstants.name],
        email: json[SignUpRepoConstants.email],
        phoneNumber: json[SignUpRepoConstants.phone] ?? "",
        pictureUrl: json[SignUpRepoConstants.pictureUrl] ??
            AppImages.assetsImagesUserImage,
        password: json[SignUpRepoConstants.password],
        emailConfirmed: json[SignUpRepoConstants.emailConfirmed] ?? false,
        phoneNumberConfirmed: json[SignUpRepoConstants.phoneConfirmed] ?? false,
        twoFactorEnabled: json[SignUpRepoConstants.twoFactorEnabled] ?? false,
        lockoutEnabled: json[SignUpRepoConstants.lockoutEnabled] ?? false,
        accessFailedCount: json[SignUpRepoConstants.accessFailedCount] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        SignUpRepoConstants.id: id,
        SignUpRepoConstants.name: name,
        SignUpRepoConstants.email: email,
        SignUpRepoConstants.phone: phoneNumber,
        SignUpRepoConstants.pictureUrl: pictureUrl,
        SignUpRepoConstants.password: password,
        SignUpRepoConstants.emailConfirmed: emailConfirmed,
        SignUpRepoConstants.phoneConfirmed: phoneNumberConfirmed,
        SignUpRepoConstants.twoFactorEnabled: twoFactorEnabled,
        SignUpRepoConstants.lockoutEnabled: lockoutEnabled,
        SignUpRepoConstants.accessFailedCount: accessFailedCount
      };
}
