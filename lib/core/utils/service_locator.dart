import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:linkdin_app/core/services/secure_storage_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<SecureStorageService>(SecureStorageService());
  // getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));

  // getIt.registerSingleton<FavoriteRepoImpl>(
  //     FavoriteRepoImpl(getIt.get<ApiService>()));
}
