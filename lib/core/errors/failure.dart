class Failure {
  final String status;
  final String message;

  Failure({required this.status, required this.message});

  factory Failure.fromJson(Map<String, dynamic> error) {
    return Failure(
      status: error['status'],
      message: error['message'],
    );
  }
}
