import 'package:app/login_screen/state/login_State.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates?> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  LoginCubit() : super(null);
  bool isUserLoggedIn = false;
  void signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firebaseAuth.authStateChanges().listen((User? user) {
        if (user != null) {
          isUserLoggedIn = true;

          emit(LoginStates(email: user.email ?? '', password: ''));
        } else {
          isUserLoggedIn = false;
          emit(null);
        }
      });
    } catch (error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'user-not-found') {
          emit(LoginStates(
              email: email,
              password: password,
              error: 'Tài khoản không tồn tại'));
        } else if (error.code == 'wrong-password') {
          emit(LoginStates(
              email: email,
              password: password,
              error: 'Sai tài khoản hoặc mật khẩu.'));
        } else {
          emit(LoginStates(
              email: email, password: password, error: 'Lỗi không xác định.'));
        }
      }
    }
  }

  void signOut() async {
    await _firebaseAuth.signOut();
    isUserLoggedIn = false;
    emit(LoginStates(email: '', password: '', error: ''));
  }
}
