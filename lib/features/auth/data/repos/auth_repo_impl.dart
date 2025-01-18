import 'package:agri_trust/features/auth/data/repos/auth_repo.dart';
import 'package:dio/dio.dart';

import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final String baseUrl = "https://yourapi.com/api";  // Replace with your API's base URL
  final Dio dio = Dio();

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        '$baseUrl/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to login');
      }
    } on DioException catch (e) {
      throw Exception('Login error: ${e.response?.data ?? e.message}');
    }
  }
  @override
  Future<Map<String, dynamic>> register(User user) async {
    final response = await dio.post(
      '$baseUrl/register',
      data: user.toJson(),
    );

    if (response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception('Failed to register');
    }
  }
  @override
  Future<Map<String, dynamic>> socialLogin(String platformToken) async {
    try {
      final response = await dio.post(
        '$baseUrl/social-login',
        data: {'platform_token': platformToken},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to login with social platform');
      }
    } on DioException catch (e) {
      throw Exception('Social login error: ${e.response?.data ?? e.message}');
    }
  }

  @override
  Future<Map<String, dynamic>> sendResetPasswordCode(String phoneOrEmail) async {
    try {
      final response = await dio.post(
        '$baseUrl/forgot-password',
        data: {'phone_email': phoneOrEmail},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to send reset password code');
      }
    } on DioException catch (e) {
      throw Exception('Send reset password code error: ${e.response?.data ?? e.message}');
    }
  }

  @override
  Future<Map<String, dynamic>> updatePassword(String newPassword) async {
    try {
      final response = await Future.delayed(const Duration(seconds: 1), () {
        return {'success': true};
      });

      return response;
    } catch (e) {
      throw Exception("Error updating password: $e");
    }
  }

  @override
  Future<Map<String, dynamic>> verifyResetCode(String code) async {
    try {
      final response = await Future.delayed(const Duration(seconds: 1), () {
        return {'success': true};
      });

      return response;
    } catch (e) {
      throw Exception("Error verifying reset code: $e");
    }
  }

}
