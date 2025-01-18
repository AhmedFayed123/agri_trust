import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with the server.');

      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout with the server.');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout with the server.');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );

      case DioExceptionType.cancel:
        return const ServerFailure('Request to the server was canceled.');

      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return const ServerFailure('No internet connection.');
        }
        return const ServerFailure('Unexpected error, please try again.');

      default:
        return const ServerFailure('An unknown error occurred, please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return const ServerFailure('An unknown error occurred, please try again.');
    }

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        final errorMessage = response?['error']?['message'] ?? 'Unauthorized request.';
        return ServerFailure(errorMessage);

      case 404:
        return const ServerFailure('The requested resource was not found.');

      case 500:
        return const ServerFailure('Internal server error, please try later.');

      default:
        return const ServerFailure('An error occurred, please try again.');
    }
  }
}
