class RegisterReqModel {
  final String email;
  final String resetCode;
  final String newPassword;

  RegisterReqModel({
    required this.email,
    required this.resetCode,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'reset_code': resetCode,
      'new_password': newPassword,
    };
  }
}
