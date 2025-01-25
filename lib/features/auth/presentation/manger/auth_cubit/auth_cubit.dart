import 'package:agri_trust/core/utils/functions/show_success_bottom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agri_trust/features/auth/data/repos/auth_repo_impl.dart';
import 'package:agri_trust/features/auth/presentation/manger/auth_cubit/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/services/token_service.dart';
import '../../../data/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl _authRepoImpl;

  AuthCubit(this._authRepoImpl) : super(AuthInitialState()) {
    _loadRememberedCredentials();
  }

  int? userId;

  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  bool _rememberMe = false;

  bool get rememberMe => _rememberMe;

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
  TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  Future<void> _loadRememberedCredentials() async {
    emit(AuthLoadingState());
    try {
      final token = await TokenService.getToken();
      if (token != null && token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        loginEmailController.text = prefs.getString('email') ?? '';
        loginPasswordController.text = prefs.getString('password') ?? '';
        _rememberMe = prefs.getBool('remember_me') ?? false;
        emit(AuthCredentialsLoadedState(_rememberMe));
      } else {
        emit(AuthErrorState(message: 'لم يتم العثور على توكن.'));
      }
    } catch (e) {
      emit(AuthErrorState(message: 'حدث خطأ أثناء تحميل بيانات تسجيل الدخول'));
    }
  }


  void toggleRememberMe() async {
    _rememberMe = !_rememberMe;
    emit(AuthLoadingState());
    try {
      if (_rememberMe) {
        await _saveCredentials();
      } else {
        await _clearCredentials();
      }
      emit(AuthToggleRememberState(_rememberMe));
    } catch (e) {
      emit(AuthErrorState(message: 'حدث خطأ أثناء تغيير إعداد تذكرني'));
    }
  }

  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', loginEmailController.text);
    await prefs.setString('password', loginPasswordController.text);
    await prefs.setBool('remember_me', true);
    emit(AuthSuccessState());
  }

  Future<void> _clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.setBool('remember_me', false);
    emit(AuthSuccessState());
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    emit(AuthInitialState());
  }

  String? validateEmail(String email) {
    email = email.trim();
    if (email.isEmpty) return "البريد الإلكتروني مطلوب.";
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[a-zA-Z]{2,}$").hasMatch(email)) {
      return "البريد الإلكتروني غير صالح.";
    }
    return null;
  }

  bool isPasswordValid(String password) {
    return password.isNotEmpty && password.length >= 6;
  }

  bool arePasswordsMatching(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  String? validatePassword(String password) {
    password = password.trim();
    if (password.isEmpty) return "كلمة المرور مطلوبة.";
    if (password.length < 8) {
      return "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل.";
    }
    return null;
  }

  String? validateName(String name) {
    name = name.trim();
    if (name.isEmpty) return "الاسم مطلوب.";
    return null;
  }

  String? validatePhone(String phone) {
    phone = phone.trim();
    if (phone.isEmpty) return "رقم الهاتف مطلوب.";
    if (!RegExp(r"^\+?[0-9]{7,15}$").hasMatch(phone)) {
      return "رقم الهاتف غير صالح.";
    }
    return null;
  }

  String? validateRequiredField(String value, String fieldName) {
    value = value.trim();
    if (value.isEmpty) {
      return "$fieldName مطلوب.";
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
      final location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          emit(LoginErrorState(
              passwordError: "يجب تفعيل خدمة الموقع لإكمال تسجيل الدخول."));
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          emit(LoginErrorState(
              passwordError: "يجب منح صلاحيات الموقع لإكمال تسجيل الدخول."));
          return;
        }
      }

      locationData = await location.getLocation();

      double latitude = locationData.latitude ?? 0.0;
      double longitude = locationData.longitude ?? 0.0;

      final response = await _authRepoImpl.login(
        loginEmailController.text,
        loginPasswordController.text,
        longitude,
        latitude,
      );

      if (response['result'] == true) {
        final token = response['data']['token'];

        if (token != null && token.isNotEmpty) {
          await saveToken(token);
          emit(LoginSuccessState());
          context.go(AppRoutes.home);
        } else {
          emit(LoginErrorState(
              passwordError: "تم تسجيل الدخول بنجاح ولكن لم يتم استلام توكن."));
          _showSnackBar(context, 'لم يتم استلام توكن صالح', Colors.orange);
        }
      } else {
        final errorMessage = response['error_message'] ?? 'فشل في تسجيل الدخول';
        emit(LoginErrorState(passwordError: errorMessage));
        _showSnackBar(context, errorMessage, Colors.red);
      }
    } catch (e) {
      emit(LoginErrorState(passwordError: "حدث خطأ أثناء تسجيل الدخول."));
    }
  }
  Future<void> register(BuildContext context) async {
    final validationErrors = {
      'firstName': validateName(firstNameController.text),
      'lastName': validateName(lastNameController.text),
      'email': validateEmail(registerEmailController.text),
      'phone': validatePhone(phoneController.text),
      'password': validatePassword(registerPasswordController.text),
    };

    if (validationErrors.values.any((error) => error != null)) {
      emit(RegisterErrorState(
        firstNameError: validationErrors['firstName'],
        lastNameError: validationErrors['lastName'],
        emailError: validationErrors['email'],
        phoneError: validationErrors['phone'],
        passwordError: validationErrors['password'],
      ));

      _showSnackBar(context,
          'يرجى التحقق من المدخلات الخاصة بك وحاول مرة أخرى.', Colors.red);
      return;
    }

    try {
      emit(AuthLoadingState());

      final registerRequest = RegisterRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: registerEmailController.text,
        phone: phoneController.text,
        password: registerPasswordController.text,
      );

      final response = await _authRepoImpl.register(registerRequest);
      print(response);

      if (response['user'] != null) {
        final token = response['token'];
        if (token != null && token != 0) {
          await saveToken(token);
          emit(RegisterSuccessState());
          _showSnackBar(context, 'تم التسجيل بنجاح!', Colors.green);
        } else {
          emit(RegisterErrorState());
          _showSnackBar(context,
              'تم التسجيل بنجاح، ولكن لم يتم استلام توكن صالح.', Colors.orange);
        }
      } else {
        emit(RegisterErrorState());
        _showSnackBar(context, 'مسجل بالفعل', Colors.red);
      }
    } catch (e) {
      emit(RegisterErrorState());
      _showSnackBar(context, 'مسجل بالفعل', Colors.red);
    }
  }

  Future<void> saveToken(String token) async {
    await TokenService.saveToken(token);
  }

  Future<String?> getToken() async {
    return await TokenService.getToken();
  }
  Future<void> sendResetCode(String phoneNumber, BuildContext context) async {
    final phoneError = validatePhone(phoneNumber);

    if (phoneError != null) {
      emit(ResetPasswordErrorState(phoneError: phoneError));
      return;
    }

    try {
      emit(AuthLoadingState());

      final response = await _authRepoImpl.sendResetPasswordCode(phoneNumber);

      if (response['result'] == true) {
        final otp = response['data']['otp'];
        userId = response['data']['user_id'];
        final expiresAt = response['data']['expires_at'];

        emit(ResetPasswordCodeSentState());
        context.go(
          AppRoutes.codeVerificationView,
          extra: {'id': userId, 'phoneNumber': phoneNumber},
        );
        checkOtp(otp, userId!, context);
        print(userId);
      } else {
        emit(ResetPasswordErrorState());
        _showSnackBar(context, "فشل في إرسال الرمز", Colors.red);
      }
    } catch (e) {
      emit(ResetPasswordErrorState());
    }
  }

  Future<void> checkOtp(String otp, int userId, BuildContext context) async {
    try {
      emit(AuthLoadingState());

      final response = await _authRepoImpl.checkOtp(otp, userId);

      if (response['result'] == true) {
        if (response['data'][0]['expires_at'] == "not expired") {
          emit(ResetPasswordSuccessState());
          context.go(
            AppRoutes.createNewPassword,
            extra: {
              'id': userId,
            },
          );
        } else {
          emit(ResetPasswordErrorState(phoneError: "انتهت صلاحية الرمز"));
          _showSnackBar(context, "انتهت صلاحية الرمز", Colors.red);
        }
      } else {
        emit(ResetPasswordErrorState(phoneError: "رمز غير صالح"));
        _showSnackBar(context, "رمز غير صالح", Colors.red);
      }
    } catch (e) {
      emit(ResetPasswordErrorState(phoneError: "حدث خطأ أثناء التحقق"));
    }
  }

  Future<void> updatePassword(
    String newPassword,
    String confirmPassword,
    BuildContext context,
    int userId,
  ) async {
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      emit(ResetPasswordErrorState(passwordError: "كلمة المرور مطلوبة"));
      return;
    }

    if (newPassword != confirmPassword) {
      emit(ResetPasswordErrorState(passwordError: "كلمات المرور غير متطابقة"));
      return;
    }

    try {
      emit(AuthLoadingState());

      final response = await _authRepoImpl.updatePassword(
        newPassword,
        userId,
        confirmPassword,
      );

      if (response.containsKey('result') && response['result'] == true) {
        if (response['data_status'] == true) {
          emit(ResetPasswordSuccessState());
          showSuccessBottomDialog(context);
        } else {
          emit(ResetPasswordErrorState(
            passwordError: response['error_message'] ?? "فشل تحديث كلمة المرور",
          ));
        }
      } else {
        emit(ResetPasswordErrorState(
          passwordError: response['error'] ?? "فشل تحديث كلمة المرور",
        ));
      }
    } catch (e) {
      emit(ResetPasswordErrorState(passwordError: "حدث خطأ غير متوقع"));
    }
  }

  void switchToLoginView() {
    _clearRegistrationFields();
    emit(LoginViewState());
  }

  void switchToRegisterView() {
    _clearLoginFields();
    emit(RegisterViewState());
  }

  void _clearLoginFields() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  void _clearRegistrationFields() {
    registerEmailController.clear();
    registerPasswordController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
  }


  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
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
