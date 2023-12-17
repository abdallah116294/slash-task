import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:slash_task/core/api/api_consumer.dart';
import 'package:slash_task/core/api/api_endpoints.dart';
import 'package:slash_task/core/api/app_interceptors.dart';
import 'package:slash_task/core/api/status_code.dart';
import 'package:slash_task/core/error/exception.dart';
import 'package:slash_task/injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;
  DioConsumer({required this.client}) {
    // (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // } as CreateHttpClient?;
    client.options
      ..baseUrl = APIEndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }
  @override
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParametes}) async {
    try {
      final response = await client.get(path, queryParameters: queryParametes);
      return _handleResponseAsJson(response);
     // return response.data;
    } on DioException catch (error) {
      _handleDioError(error);
      throw();
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = json.decode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioException error) {
    if (error.type
        case DioExceptionType.connectionTimeout ||
            DioExceptionType.sendTimeout ||
            DioException.receiveTimeout) {
      throw const FetchDataException();
    } else if (error.type case DioExceptionType.values) {
      switch (error.response?.statusCode) {
        case StatusCode.badRequest:
          throw const BadRequestException();
        case StatusCode.unauthorized:
        case StatusCode.forbidden:
          throw const UnauthorizedException();
        case StatusCode.notFound:
          throw const NotFoundException();
        case StatusCode.confilct:
          throw const ConflictException();

        case StatusCode.internalServerError:
          throw const InternalServerErrorException();
      }
    } else if (error.type case DioExceptionType.cancel) {
    } else if (error.type case DioExceptionType.unknown) {
      throw const NoInternetConnectionException();
    } else if (error.type
        case DioExceptionType.receiveTimeout ||
            DioExceptionType.badCertificate) {}
  }
}
