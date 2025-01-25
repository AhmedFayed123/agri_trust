import 'package:agri_trust/core/network/api_endpoints.dart';
import 'package:agri_trust/core/services/token_service.dart';
import 'package:agri_trust/features/auth/data/repos/auth_repo.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/network_service.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final Dio dio = Dio();
  final NetworkService _networkService = NetworkService();

  @override
  Future<Map<String, dynamic>> login(
      String email, String password, double longitude, double latitude) async {
    try {
      final loginRequest = LoginRequestModel(
        email: email,
        password: password,
        longitude: longitude,
        latitude: latitude,
      );

      final response = await _networkService.postRequest(
        ApiEndpoints.login,
        data: loginRequest.toMap(),
      );

      if (response.data != null) {
        final token = response.data['token'];
        if (token != null && token != 0) {
          await TokenService.saveToken(token);
        }
      }
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('Login Error: ${e.message}');
      return {
        'error': 'فشل تسجيل الدخول: ${e.response?.data['message'] ?? e.message}'
      };
    }
  }

  @override
  Future<Map<String, dynamic>> register(RegisterRequestModel registerRequest) async {
    try {
      final response = await _networkService.postRequest(
        ApiEndpoints.register,
        data: registerRequest.toMap(),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('Request: ${e.requestOptions.uri}');
      print('Headers: ${e.requestOptions.headers}');
      print('Data: ${e.requestOptions.data}');
      print('Status Code: ${e.response?.statusCode}');
      print('Response Data: ${e.response?.data}');
      return {
        'error': 'فشل التسجيل: ${e.response?.data['message'] ?? e.message}'
      };
    }
  }
  //
  // @override
  // Future<Map<String, dynamic>> socialLogin(String platformToken) async {
  //   try {
  //     final response = await dio.post(
  //       '$baseUrl/social-login',
  //       data: {'platform_token': platformToken},
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return response.data;
  //     } else {
  //       throw Exception('Failed to login with social platform');
  //     }
  //   } on DioException catch (e) {
  //     throw Exception('Social login error: ${e.response?.data ?? e.message}');
  //   }
  // }

  @override
  Future<Map<String, dynamic>> sendResetPasswordCode(String phoneOrEmail) async {
    try {
      final response = await _networkService.postRequest(
        ApiEndpoints.forgetPassword,
        data: {'phone': phoneOrEmail},
      );

      if (response.data != null && response.data['result'] == true) {
        return response.data as Map<String, dynamic>;
      } else {
        String errorMessage = response.data['message'] ?? 'مشكلة غير معروفة';
        return {
          'error': 'فشل في إرسال الرمز: $errorMessage'
        };
      }
    } on DioException catch (e) {
      String errorMessage = e.response?.data['message'] ?? e.message ?? 'خطأ غير معروف';
      print('Send Reset Password Error: $errorMessage');
      return {
        'error': 'فشل في إرسال الرمز: $errorMessage'
      };
    } catch (e) {
      print('Unexpected Error: $e');
      return {
        'error': 'فشل في إرسال الرمز: خطأ غير متوقع.'
      };
    }
  }

  @override
  Future<Map<String, dynamic>> updatePassword(
      String newPassword,
      int userId,
      String passwordConfirmation
      ) async {
    try {
      final data = {
        'user_id': userId,
        'password': newPassword,
        'password_confirmation': passwordConfirmation,
      };

      final response = await _networkService.postRequest(
        ApiEndpoints.newPassword,
        data: data,
      );

      if (response.data != null) {
        return response.data as Map<String, dynamic>;
      } else {
        return {
          'error': 'حدث خطأ أثناء تحديث كلمة المرور'
        };
      }
    } on DioException catch (e) {
      print('Update Password Error: ${e.message}');
      return {
        'error': 'فشل تحديث كلمة المرور: ${e.response?.data['message'] ?? e.message}'
      };
    }
  }

  @override
  Future<Map<String, dynamic>> checkOtp(String otp, int userId) async {
    try {
      final response = await _networkService.postRequest(
        ApiEndpoints.checkOtp,
        data: {
          'otp': otp,
          'user_id': userId,
        },
      );

      if (response.data != null && response.data['result'] == true) {
        return response.data as Map<String, dynamic>;
      } else {
        return {
          'error': 'فشل في التحقق من الرمز: ${response.data['message'] ?? 'مشكلة غير معروفة'}'
        };
      }
    } on DioException catch (e) {
      print('Check OTP Error: ${e.message}');
      return {
        'error': 'فشل في التحقق من الرمز: ${e.response?.data['message'] ?? e.message}'
      };
    }
  }


}
