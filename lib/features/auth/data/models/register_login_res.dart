class RegisterResModel {
  final String status;
  final String message;
  final String token;

  RegisterResModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory RegisterResModel.fromJson(Map<String, dynamic> dataResponse) {
    return RegisterResModel(
      status: dataResponse['status'],
      message: dataResponse['message'],
      token: dataResponse['token'],
    );
  }
}
