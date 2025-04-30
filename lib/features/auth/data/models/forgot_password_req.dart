class RegisterReqModel {
  final String email;

  RegisterReqModel({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
