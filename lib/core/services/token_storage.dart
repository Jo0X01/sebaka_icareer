import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const _tokenKey = 'auth_token';

  final SharedPreferences _prefs;

  TokenStorage(this._prefs);

  String? get token => _prefs.getString(_tokenKey);

  bool get hasToken => token != null;

  Future<void> save(String token) => _prefs.setString(_tokenKey, token);

  Future<void> clear() => _prefs.remove(_tokenKey);
}
