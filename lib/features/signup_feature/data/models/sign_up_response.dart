class SignUpResponse {
  final String name;
  final String token;

  SignUpResponse({required this.name, required this.token});

  static SignUpResponse fromJson(Map<String, dynamic> json) => SignUpResponse(
        token: json['token'],
        name: json['user name'],
      );
}
