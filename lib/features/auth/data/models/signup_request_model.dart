class SignupRequestModel {
  final String name;
  final String username;
  final String password;
  final String email;
  final String mobileNumber;
  final String dob;

  SignupRequestModel({
    required this.name,
    required this.username,
    required this.password,
    required this.mobileNumber,
    required this.email,
    required this.dob,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'usename': username,
      'password': password,
      'email': email,
      'mobileNumber': mobileNumber,
      'dob': dob,
    };
  }
}
