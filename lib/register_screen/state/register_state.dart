class RegisterState {
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? error;
  RegisterState({this.email, this.password, this.confirmPassword, this.error});
  factory RegisterState.success() {
    return RegisterState(
        email: '', password: '', confirmPassword: '', error: null);
  }
  factory RegisterState.error(String error) {
    return RegisterState(
        email: '', password: '', confirmPassword: '', error: error);
  }
}
