import '../models/user_model.dart';

abstract class AuthRepo {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> register(User user);
  Future<Map<String, dynamic>> socialLogin(String platformToken);
  Future<Map<String, dynamic>> sendResetPasswordCode(String phoneOrEmail);
  Future<Map<String, dynamic>> verifyResetCode(String code);
  Future<Map<String, dynamic>> updatePassword(String newPassword);

  }
