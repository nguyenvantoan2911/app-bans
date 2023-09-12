import 'package:app/register_screen/state/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState?> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  RegisterCubit() : super(null);
  Future<void> signUp(
      String email, String password, String confirmPassword) async {
    try {
      if (password != confirmPassword) {
        emit(RegisterState.error('Mật khẩu không khớp'));
      } else if (password.length < 6) {
        emit(RegisterState.error('Mật khẩu phải ít nhất 6 kí tự'));
      } else if (!email.endsWith('@gmail.com')) {
        emit(RegisterState.error('Email phải sử dụng tên miền @gmail.com'));
      } else {
        final userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        emit(RegisterState.success());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterState.error('Mật khẩu quá yếu'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterState.error('Tài khoản đã tồn tại'));
      }
    }
  }
}
