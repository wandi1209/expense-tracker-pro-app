import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Save token and timestamp to secure storage
  Future<void> saveToken(String? token) async {
    try {
      if (token != null) {
        await _storage.write(key: 'token', value: token);
        String timestamp = DateTime.now().toIso8601String();
        await _storage.write(key: 'token_timestamp', value: timestamp);
        debugPrint(token);
      }
    } catch (e) {
      debugPrint('Error saving token: $e');
    }
  }

  // Get token if it's valid and not expired
  Future<String?> getToken() async {
    try {
      String? token = await _storage.read(key: 'token');
      String? timestampString = await _storage.read(key: 'token_timestamp');

      if (token != null && timestampString != null) {
        DateTime timestamp = DateTime.parse(timestampString);
        if (DateTime.now().difference(timestamp).inMinutes >= 60) {
          await clearToken();
          debugPrint('Token expired and cleared');
          return null;
        }
        return token;
      }

      debugPrint('No token found');
      return null;
    } catch (e) {
      debugPrint('Error getting token: $e');
      return null;
    }
  }

  // Clear token and timestamp
  Future<void> clearToken() async {
    try {
      await _storage.delete(key: 'token');
      await _storage.delete(key: 'token_timestamp');
    } catch (e) {
      debugPrint('Error clearing token: $e');
    }
  }
}
