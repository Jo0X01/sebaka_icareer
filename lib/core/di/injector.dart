import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sebaka/core/networking/dio_factory.dart';
import 'package:sebaka/core/services/token_storage.dart';
import 'package:sebaka/features/signup/data/repo/signup_repo.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<TokenStorage>(() => TokenStorage(prefs));

  getIt.registerLazySingleton<Dio>(() => DioFactory.create(getIt<TokenStorage>()));

  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt(), getIt()));
}
