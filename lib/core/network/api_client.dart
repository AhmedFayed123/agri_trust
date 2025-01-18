import 'package:dio/dio.dart';
import 'network_interceptor.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://example.com/api', // Replace with your base URL
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  ) {
    _dio.interceptors.add(NetworkInterceptor());
  }

  Dio get dio => _dio;
}
