import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get_it/get_it.dart';
import 'package:uztelecom/app/auth/repositories/auth_repository.dart';
import 'package:uztelecom/core/cache_manager.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton<CacheManager>(() => CacheManager());
  locator.registerLazySingleton<AuthRepository>(() =>
      AuthRepository(const FlutterAppAuth(), locator.get<CacheManager>()));
}
