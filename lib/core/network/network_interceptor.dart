import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request to ${options.uri}');
    print('Headers: ${options.headers}');
    print('Data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response from ${response.requestOptions.uri}');
    print('Status code: ${response.statusCode}');
    print('Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('Error occurred: ${err.message}');
    print('Request: ${err.requestOptions.uri}');

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        print('Connection timeout.');
        break;
      case DioExceptionType.receiveTimeout:
        print('Receive timeout.');
        break;
      case DioExceptionType.sendTimeout:
        print('Send timeout.');
        break;
      case DioExceptionType.badResponse:
        print('Bad response: ${err.response?.statusCode}');
        break;
      case DioExceptionType.cancel:
        print('Request was cancelled.');
        break;
      case DioExceptionType.connectionError:
        print('No internet connection.');
        break;
      default:
        print('Unknown error occurred: ${err.message}');
    }
    super.onError(err, handler);
  }
}
