abstract class RemoteDatasource {
  Future<Map<String, dynamic>> register(String name, String email, String password, String confirmPassword);
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> forgotPassword(String email);
  Future<Map<String, dynamic>> resetPassword(String email, String resetCode, String newPassword);
}
