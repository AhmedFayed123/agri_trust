import '../models/user_model.dart';

abstract class AuthRepo {
  Future<Map<String, dynamic>> login(
      String email, String password, double longitude, double latitude);

  Future<Map<String, dynamic>> register(RegisterRequestModel registerRequest);

  // Future<Map<String, dynamic>> socialLogin(String platformToken);

  Future<Map<String, dynamic>> sendResetPasswordCode(String phoneOrEmail);

  Future<Map<String, dynamic>> checkOtp(String otp, int userId);

  Future<Map<String, dynamic>> updatePassword(
      String newPassword, int userId, String passwordConfirmation);
}
