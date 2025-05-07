class AuthResModel {
  final String status;
  final String message;
  final String? accessToken;

  AuthResModel({required this.status, required this.message, this.accessToken});

  factory AuthResModel.fromJson(Map<String, dynamic> dataResponse) {
    return AuthResModel(
      status: dataResponse['status'],
      message: dataResponse['message'],
      accessToken: dataResponse['accessToken'],
    );
  }
}
