class Profile {
  final String name;
  final String email;
  final String? phone;
  final int userPoints;

  Profile({
    required this.name,
    required this.email,
    this.phone,
    required this.userPoints,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      userPoints: json['user_points'] ?? 0,
    );
  }
}
