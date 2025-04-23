import 'dart:io';
import '../repo/sign_up_repo_constants.dart';

class SignUpInputModel {
  String email;
  String password;
  String name;
  String phone;
  String gender;
  File image;

  SignUpInputModel({
    required this.email,
    required this.password,
    required this.name,
    required this.image,
    this.phone = "01000000000",
    this.gender = "",
  });
/*
convertAssetImageToFile(
        'assets/images/user_default_image.jpg', 'default_user_image.png')
*/
  Map<String, dynamic> toJson() => {
        SignUpRepoConstants.email: email,
        SignUpRepoConstants.password: password,
        SignUpRepoConstants.name: name,
        SignUpRepoConstants.passwordConfirmation: password,
        SignUpRepoConstants.phone: phone,
        SignUpRepoConstants.gender: gender,
        SignUpRepoConstants.image: image,
      };
}
/*class SignUpUserModel {
  String id;
  String name;
  String email;
  String phone;
  String password;
  String userImageUrl;
  String createdAt;

  SignUpUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.userImageUrl,
    required this.createdAt,
  });

  static SignUpUserModel fromJson(Map<String, dynamic> json) => SignUpUserModel(
        id: json[SignUpRepoConstants.id],
        name: json[SignUpRepoConstants.name],
        email: json[SignUpRepoConstants.email],
        phone: json[SignUpRepoConstants.phone] ?? "",
        userImageUrl:
            "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?t=st=1733863368~exp=1733866968~hmac=dcf753cc48215353e01269e8d6aaf27adfa1e7eff7d23173fd74e6dda73b5dd2&w=740",
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        password: json[SignUpRepoConstants.password],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "userImageUrl": userImageUrl,
        "createdAt": createdAt,
      };
}*/
