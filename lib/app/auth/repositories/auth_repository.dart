import 'package:flutter/foundation.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:uztelecom/app/auth/model/token_model.dart';
import 'package:uztelecom/core/cache_manager.dart';
import 'package:uztelecom/core/constants.dart';

class AuthRepository {
  AuthRepository(this._appAuth, this._cacheManager);
  final FlutterAppAuth _appAuth;
  final CacheManager _cacheManager;

  Future<TokenModel?> authorization() async {
    final authTokenResponse =
        await _appAuth.authorizeAndExchangeCode(AuthorizationTokenRequest(
      clientId,
      redirectUri,
      discoveryUrl: discoveryUrl,
      issuer: authIssuer,
      serviceConfiguration: const AuthorizationServiceConfiguration(
          authorizationEndpoint: authorizationEndpoint,
          tokenEndpoint: tokenEndPoint,
          endSessionEndpoint: endSessionEndpoint),
      scopes: [
        'openid',
        'profile',
        'email',
        'offline_access',
      ],
    ));
    debugPrint('Auth response ---------------------- $authTokenResponse');

    if (authTokenResponse != null) {
      final tokenModel = TokenModel(
          access: authTokenResponse.accessToken,
          refresh: authTokenResponse.refreshToken);
      _cacheManager.setToken(tokenModel);
      return tokenModel;
    } else {
      return null;
    }
  }
}
