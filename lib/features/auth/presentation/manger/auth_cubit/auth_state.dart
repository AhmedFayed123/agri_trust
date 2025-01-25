// Abstract base class for all authentication states
abstract class AuthState {}

// General States
class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailureState extends AuthState {
  final String errorMessage;

  AuthFailureState({required this.errorMessage});
}

class AuthLoggedOutState extends AuthState {}

// Login States
class LoginViewState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String? emailError;
  final String? passwordError;

  LoginErrorState({this.emailError, this.passwordError});
}

// Register States
class RegisterViewState extends AuthState {}

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
class AuthCredentialsLoadedState extends AuthState {
  final bool rememberMe;

  AuthCredentialsLoadedState(this.rememberMe);
}

class AuthToggleRememberState extends AuthState {
  final bool rememberMe;

  AuthToggleRememberState(this.rememberMe);
}


class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}
// Reset Password States

class ResetPasswordCodeVerifiedState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordErrorState extends AuthState {
  final String? phoneError;
  final String? codeError;
  final String? passwordError;

  ResetPasswordErrorState({
    this.phoneError,
    this.codeError,
    this.passwordError,
  });
}


class ResetPasswordCodeSentState extends AuthState {

}

