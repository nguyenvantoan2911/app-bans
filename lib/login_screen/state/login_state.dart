class LoginStates {
  late String email;
  late String password;
  late String error;
  bool isInputValid;
  LoginStates({
    this.isInputValid = false,
    required this.email,
    required this.password,
    required this.error,
  });

  LoginStates copyWith(
      {String? email, String? password, String? error, bool? isInputValid}) {
    return LoginStates(
        isInputValid: isInputValid ?? this.isInputValid,
        email: email ?? this.email,
        password: password ?? this.password,
        error: error ?? this.error);
  }
}
