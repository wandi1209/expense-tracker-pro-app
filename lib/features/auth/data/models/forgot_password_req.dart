class ForgotPasswordReqModel {
  final String email;

  ForgotPasswordReqModel({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
