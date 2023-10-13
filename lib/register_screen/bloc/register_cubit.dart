import 'package:app/register_screen/state/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  RegisterCubit()
      : super(RegisterState(
            email: '', password: '', confirmPassword: '', error: ''));
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  langnghe(String value, String name) {
    if (name == 'email') {
      state.email = value;
    } else if (name == 'password') {
      state.password = value;
    } else if (name == 'confirmPassword') {
      state.confirmPassword = value;
    }
    hiennut();
  }

  void hiennut() {
    if (state.email != '' &&
        state.password != '' &&
        state.confirmPassword != '') {
      emit(state.copyWith(isInputValid: true));
    } else {
      emit(state.copyWith(isInputValid: false));
    }
  }

  Future<void> signUp() async {
    try {
      if (state.password != state.confirmPassword) {
        emit(state.copyWith(error: 'mật khẩu không khớp'));
      } else if (state.password.length < 6) {
        emit(state.copyWith(error: 'Mật khẩu phải ít nhất 6 kí tự'));
      } else if (!emailRegex.hasMatch(state.email)) {
        emit(state.copyWith(error: 'Email phải sử dụng tên miền @gmail.com'));
      } else {
        final userCredential =
            await _firebaseAuth.createUserWithEmailAndPassword(
                email: state.email, password: state.password);
        await _firebaseAuth.signOut();
        emit(state.copyWith(
            error: '',
            email: state.email,
            password: state.password,
            confirmPassword: state.confirmPassword,
            isRegistrySuccess: true));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(state.copyWith(error: 'Mật khẩu quá yếu'));
      } else if (e.code == 'email-already-in-use') {
        emit(state.copyWith(error: 'Tài khoản đã tồn tại'));
      }
    }
  }
}
