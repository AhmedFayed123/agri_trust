import 'package:dio/dio.dart';
import '../errors/server_failures.dart';
import 'api_client.dart';

class NetworkService {
  final Dio _dio = ApiClient().dio;

  Future<Response> getRequest(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParams);
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  Future<Response> postRequest(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
