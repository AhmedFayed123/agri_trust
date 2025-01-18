abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailureState extends AuthState {
  final String errorMessage;

  AuthFailureState({required this.errorMessage});
}

class AuthLoggedOutState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String? emailError;
  final String? passwordError;

  LoginErrorState({this.emailError, this.passwordError});
}
class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? phoneError;
  final String? passwordError;

  RegisterErrorState({
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.phoneError,
    this.passwordError,
  });
}

class LoginViewState extends AuthState {}

class RegisterViewState extends AuthState {}
class ResetPasswordCodeSentState extends AuthState {}

class ResetPasswordCodeVerifiedState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordErrorState extends AuthState {
  final String? phoneError;
  final String? codeError;
  final String? passwordError;

  ResetPasswordErrorState({this.phoneError, this.codeError, this.passwordError});
}