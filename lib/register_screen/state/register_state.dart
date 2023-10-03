class RegisterState {
  late String email;
  late String password;
  late String confirmPassword;
  late String error;
  late bool isInputValid;
  late bool isRegistrySuccess;
  RegisterState(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      required this.error,
      this.isInputValid = false,
      this.isRegistrySuccess = false});
  RegisterState copyWith(
      {bool? isInputValid,
      String? email,
      String? password,
      String? confirmPassword,
      String? error,
      bool? isRegistrySuccess}) {
    return RegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        error: error ?? this.error,
        isInputValid: isInputValid ?? this.isInputValid,
        isRegistrySuccess: isRegistrySuccess ?? this.isRegistrySuccess);
  }
}
