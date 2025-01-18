import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agri_trust/features/auth/data/repos/auth_repo_impl.dart';
import 'package:agri_trust/features/auth/presentation/manger/auth_cubit/auth_state.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/router/routes.dart';
import '../../../data/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl _authRepoImpl;

  AuthCubit(this._authRepoImpl) : super(AuthInitialState());

  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  bool _rememberMe = false;

  bool get rememberMe => _rememberMe;

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> sendResetCode(String phoneNumber, BuildContext context) async {
    final phoneError = validatePhone(phoneNumber);

    if (phoneError != null) {
      emit(ResetPasswordErrorState(phoneError: phoneError));
      return;
    }

    try {
      emit(AuthLoadingState());
      final response = await _authRepoImpl.sendResetPasswordCode(phoneNumber);

      if (response['success']) {
        emit(ResetPasswordCodeSentState());
        context.go(AppRoutes.codeVerificationView);
      } else {
        emit(ResetPasswordErrorState(phoneError: response['message'] ?? "Failed to send code"));

      }
    } catch (e) {
      emit(ResetPasswordErrorState(phoneError: e.toString()));

    }
  }

  Future<void> verifyCode(String code, BuildContext context) async {
    if (code.isEmpty) {
      emit(ResetPasswordErrorState(codeError: "Code is required"));
      return;
    }

    try {
      emit(AuthLoadingState());
      final response = await _authRepoImpl.verifyResetCode(code);
      if (response['success']) {
        emit(ResetPasswordCodeVerifiedState());
        context.go(AppRoutes.createNewPassword);
      } else {
        emit(ResetPasswordErrorState(codeError: response['message'] ?? "Invalid code"));
      }
    } catch (e) {
      emit(ResetPasswordErrorState(codeError: e.toString()));
    }
  }

  Future<void> updatePassword(String newPassword, String confirmPassword, BuildContext context) async {
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      emit(ResetPasswordErrorState(passwordError: "Password fields are required"));
      return;
    }

    if (newPassword != confirmPassword) {
      emit(ResetPasswordErrorState(passwordError: "Passwords do not match"));
      return;
    }

    try {
      emit(AuthLoadingState());
      final response = await _authRepoImpl.updatePassword(newPassword);

      if (response['success']) {
        emit(ResetPasswordSuccessState());
        context.go(AppRoutes.login);
      } else {
        emit(ResetPasswordErrorState(passwordError: response['message'] ?? "Failed to update password"));
      }
    } catch (e) {
      emit(ResetPasswordErrorState(passwordError: e.toString()));
    }
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    emit(AuthInitialState());
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    emit(AuthInitialState());
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Email required.";
    } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      return "Email is invalid.";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password required.";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters.";
    }
    return null;
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return "Name required.";
    }
    return null;
  }

  String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return "Phone number required.";
    } else if (!RegExp(r"^\+?[0-9]{10,15}$").hasMatch(phone)) {
      return "Invalid phone number.";
    }
    return null;
  }

  Future<void> loginWithEmail(BuildContext context) async {
    final emailError = validateEmail(loginEmailController.text);
    final passwordError = validatePassword(loginPasswordController.text);

    if (emailError != null || passwordError != null) {
      emit(LoginErrorState(
          emailError: emailError, passwordError: passwordError));
      return;
    }

    try {
      emit(AuthLoadingState());
      final response = await _authRepoImpl.login(
        loginEmailController.text,
        loginPasswordController.text,
      );
      if (response['success']||false) {
        emit(LoginSuccessState());
        // context.go(AppRoutes.home);
      } else {
        emit(LoginErrorState(
          emailError: null,
          passwordError: response['message'] ?? "login failed.",
        ));
      }
    } catch (e) {
      emit(LoginErrorState(
        emailError: null,
        passwordError: e.toString(),
      ));
    }
  }

  Future<void> register(BuildContext context) async {
    final firstNameError = validateName(firstNameController.text);
    final lastNameError = validateName(lastNameController.text);
    final emailError = validateEmail(registerEmailController.text);
    final phoneError = validatePhone(phoneController.text);
    final passwordError = validatePassword(registerPasswordController.text);

    if (firstNameError != null ||
        lastNameError != null ||
        emailError != null ||
        phoneError != null ||
        passwordError != null) {
      emit(RegisterErrorState(
        firstNameError: firstNameError,
        lastNameError: lastNameError,
        emailError: emailError,
        phoneError: phoneError,
        passwordError: passwordError,
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please check your inputs and try again.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      emit(AuthLoadingState());
      final user = User(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: registerEmailController.text,
        phone: phoneController.text,
        password: registerPasswordController.text,
      );

      final response = await _authRepoImpl.register(user);
      if (response['success']) {
        emit(RegisterSuccessState());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration Successful!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        emit(RegisterErrorState(
          firstNameError: firstNameError,
          lastNameError: lastNameError,
          emailError: emailError,
          phoneError: phoneError,
          passwordError: passwordError,
        ));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['message'] ?? 'Registration failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      emit(RegisterErrorState(
        firstNameError: firstNameError,
        lastNameError: lastNameError,
        emailError: emailError,
        phoneError: phoneError,
        passwordError: passwordError,
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void switchToLoginView() {
    registerEmailController.clear();
    registerPasswordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emit(LoginViewState());
  }

  void switchToRegisterView() {
    loginEmailController.clear();
    loginPasswordController.clear();
    emit(RegisterViewState());
  }

  @override
  Future<void> close() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
