import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constant/api.dart';

class ApiBookProvider {
  final Dio dio;
  ApiBookProvider({required this.dio});
  Future<Response> callBooks() async {
    var response = await dio.get(ApiConstant.bookApiPath);
    return response;
  }

  Future<Response> callQuestion() async {
    var response = await dio.get(ApiConstant.questionApiPath);
    return response;
  }
}
