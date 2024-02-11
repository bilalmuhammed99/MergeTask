class LoginRequestBody {
  final String username;
  final String password;

  LoginRequestBody({required this.username, required this.password});

   Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory LoginRequestBody.fromJson(Map<String, dynamic> json) {
    return LoginRequestBody(
      username: json['username'],
      password: json['password'],
    );
  }

}
