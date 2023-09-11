class LoginStates {
  final String email;
  final String password;
  final String? error;
  LoginStates({
    required this.email,
    required this.password,
    this.error,
  });
}
