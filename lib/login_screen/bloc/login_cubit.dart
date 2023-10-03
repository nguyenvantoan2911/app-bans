import 'package:app/login_screen/state/login_State.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  LoginCubit() : super(LoginStates(email: '', password: '', error: ''));
  bool isUserLoggedIn = false;

  void langnghe(String value, String name) {
    if (name == 'email') {
      state.email = value;
    } else if (name == 'password') {
      state.password = value;
    }
    hiennut();
  }

  hiennut() {
    if (state.email != '' && state.password != '') {
      emit(state.copyWith(isInputValid: true));
    } else {
      emit(state.copyWith(isInputValid: false));
    }
  }

  void signIn() async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      final user = userCredential.user;

      if (user != null) {
        isUserLoggedIn = true;
        emit(state.copyWith(email: state.email, password: '', error: ''));
      } else {
        isUserLoggedIn = false;
        emit(LoginStates(email: '', password: '', error: ''));
      }
    } catch (error) {
      if (error is FirebaseAuthException) {
        if (error.code == 'user-not-found') {
          emit(state.copyWith(error: 'Tài khoản không tồn tại'));
        } else if (error.code == 'wrong-password') {
          emit(state.copyWith(error: 'sai tài khoản hoặc mật khẩu.'));
        } else {
          emit(state.copyWith(error: 'Lỗi không xác định.'));
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
