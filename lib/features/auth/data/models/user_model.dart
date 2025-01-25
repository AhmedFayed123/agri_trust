class RegisterRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;

  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'f_name': firstName,
      'l_name': lastName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}
class LoginRequestModel {
  final String email;
  final String password;
  final double longitude;
  final double latitude;

  LoginRequestModel({
    required this.email,
    required this.password,
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}

