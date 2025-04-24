import '../repos/profile_repo/profile_constants.dart';

class UserModel {
  ProfileUserModel userModel;
  String imageUrl;
  Map<String, dynamic> addresses;

  UserModel(
      {required this.userModel,
      required this.imageUrl,
      required this.addresses});

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        userModel: ProfileUserModel.fromJson(json[ProfileConstants.user]),
        imageUrl: json[ProfileConstants.imageUrl] ??
            "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?t=st=1733863368~exp=1733866968~hmac=dcf753cc48215353e01269e8d6aaf27adfa1e7eff7d23173fd74e6dda73b5dd2&w=740",
        addresses: (json[ProfileConstants.addresses]) ?? {},
      );
}

class ProfileUserModel {
  int id;
  String name;
  String email;
  String phone;
  String image;
  String gender;
  String emailVerifiedAt;
  String googleId;
  String createdAt;
  String updatedAt;
  String role;

  ProfileUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.gender,
    required this.emailVerifiedAt,
    required this.googleId,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  static ProfileUserModel fromJson(Map<String, dynamic> json) =>
      ProfileUserModel(
        id: json[ProfileConstants.id] ?? -1,
        name: json[ProfileConstants.name] ?? "",
        email: json[ProfileConstants.email] ?? "",
        phone: json[ProfileConstants.phone] ?? "",
        image: json[ProfileConstants.image] ?? "",
        gender: json[ProfileConstants.gender] ?? "",
        emailVerifiedAt: json[ProfileConstants.emailverifiedAt] ?? "",
        googleId: json[ProfileConstants.googleId] ?? "",
        createdAt: json[ProfileConstants.createdAt] ?? "",
        updatedAt: json[ProfileConstants.updatedAt] ?? "",
        role: json[ProfileConstants.role] ?? "",
      );

  Map<String, dynamic> toJson() => {
        ProfileConstants.id: id,
        ProfileConstants.name: name,
        ProfileConstants.email: email,
        ProfileConstants.phone: phone,
        ProfileConstants.image: image,
        ProfileConstants.gender: gender,
        ProfileConstants.emailverifiedAt: emailVerifiedAt,
        ProfileConstants.googleId: googleId,
        ProfileConstants.createdAt: createdAt,
        ProfileConstants.updatedAt: updatedAt,
        ProfileConstants.role: role,
      };
}
