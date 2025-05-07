import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);

    String timestamp = DateTime.now().toIso8601String();
    await _storage.write(key: 'token_timestamp', value: timestamp);
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: 'token');
    String? timestampString = await _storage.read(key: 'token_timestamp');

    if (token != null && timestampString != null) {
      DateTime timestamp = DateTime.parse(timestampString);
      if (DateTime.now().difference(timestamp).inMinutes >= 60) {
        await clearToken();
        return null;
      }
      return token;
    }
    return null;
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'token_timestamp');
  }
}
