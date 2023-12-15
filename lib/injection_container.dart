import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:slash_task/core/api/app_interceptors.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
    error: true,
    request: true,
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
  ));
}
