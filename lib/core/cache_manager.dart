import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../app/auth/model/token_model.dart';

abstract class ICacheManager {
  Future<TokenModel?> get loadAccessToken;

  Future setToken(TokenModel token);
}

class CacheManager extends ICacheManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<TokenModel?> get loadAccessToken async {
    final SharedPreferences prefs = await _prefs;
    final jsonToken = prefs.getString('access');
    if (jsonToken != null) {
      return TokenModel.fromJson(jsonDecode(jsonToken));
    }
    return null;
  }

  @override
  Future setToken(TokenModel token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('access', jsonEncode(token.toJson()));
  }
}
