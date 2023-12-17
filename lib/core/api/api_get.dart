import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/core/api/api_endpoints.dart';

class DioHelper {
  final Dio _dio;
  DioHelper(this._dio);
  Future<Map<String, dynamic>> getProductsData() async {
    try {
      var response = await _dio.get(
        APIEndPoints.baseUrl + APIEndPoints.productsEndPoint,
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
       debugPrint(response.data.toString());
        return response.data as Map<String,dynamic>;
      } else {
        debugPrint('Error ${response.statusCode}');
        throw Exception("Error Exception ${response.statusCode}");
      }
    } catch (error) {
      debugPrint("$error");
      throw Exception("Error $error");
    }
  }
}
