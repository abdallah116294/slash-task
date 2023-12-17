import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:slash_task/Products/data/datasource/remoted_data_source.dart';
import 'package:slash_task/Products/data/repository/repository.dart';
import 'package:slash_task/Products/domain/repository/get_products_repository.dart';
import 'package:slash_task/Products/domain/usecase/get_products_usecase.dart';
import 'package:slash_task/Products/presentation/cubit/get_products_cubit.dart';
import 'package:slash_task/core/api/api_consumer.dart';
import 'package:slash_task/core/api/api_get.dart';
import 'package:slash_task/core/api/app_interceptors.dart';
import 'package:slash_task/core/api/dio_consumer.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // //!Products
  //cubit
  sl.registerFactory<GetProductsCubit>(
      () => GetProductsCubit(getProductsUsecse: sl()));
  //use case
  sl.registerLazySingleton<GetProductsUsecse>(
      () => GetProductsUsecse(getProductsRepository: sl()));
  // repository
  sl.registerLazySingleton<GetProductsRepository>(
      () => GetProductsRepositoryImpl(remoteDataSourc: sl()));
  //remote data source
  //dio
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioHelper(sl()));
  sl.registerLazySingleton<RemoteDataSourc>(
      () => RemoteDataSourceImpl(dioConsumer: sl(), dioHelper: sl()));
  //sl.registerLazySingleton<DioConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
        error: true,
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ));
}
