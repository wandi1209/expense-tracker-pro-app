class RegisterReqModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterReqModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
