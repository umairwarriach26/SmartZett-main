class User {
  User(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password,
      this.token});
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? token;

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
      userId: json?["user_id"] as String?,
      firstName: json?["first_name"] as String?,
      lastName: json?["last_name"] as String?,
      email: json?["email"] as String?,
      phone: json?["phone"] as String?,
      password: json?["password"] as String?,
      token: json?["token"] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "token": token,
      };
}
