import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constant/api.dart';

class ApiBookProvider {
  final Dio _dio = Dio();

  Future<Response> callBooks() async {
    var response = await _dio.get(ApiConstant.bookApiPath);
    return response;
  }
}
