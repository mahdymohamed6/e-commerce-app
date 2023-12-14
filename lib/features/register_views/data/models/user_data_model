class UserData {
  final String token;
  final String role;
  final String userId;

  const UserData({
    required this.token,
    required this.role,
    required this.userId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'],
      role: json['role'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'role': role,
      'userId': userId,
    };
  }
}