class UserAuthResModel {
  final String status;
  final String message;
  final String? token;

  UserAuthResModel({required this.status, required this.message, this.token});

  factory UserAuthResModel.fromJson(Map<String, dynamic> dataResponse) {
    return UserAuthResModel(
      status: dataResponse['status'],
      message: dataResponse['message'],
      token: dataResponse['token'],
    );
  }

  void fold(void Function(dynamic failure) param0, void Function(dynamic user) param1) {}
}
