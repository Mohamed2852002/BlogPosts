import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});
  Future<Map<String, dynamic>> get(String url, {String? accessToken}) async {
    dio.options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    final Response response = await dio.get(url);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
    String url,
    Object data, {
    String? accessToken,
  }) async {
    dio.options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    final Response response = await dio.post(url, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> put(
    String url,
    Map<String, dynamic> data,
  ) async {
    final Response response = await dio.put(url, data: data);
    return response.data;
  }
}
