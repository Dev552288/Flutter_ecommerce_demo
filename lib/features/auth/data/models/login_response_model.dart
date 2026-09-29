class LoginResponseModel {
  final bool success;
  final String message;
  final String? token;
  final String? username;
  LoginResponseModel({
    required this.success,
    required this.message,
    this.token,
    this.username,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      token: json['token'],
      username: json['username'],
    );
  }
}
