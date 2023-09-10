import 'package:app/bloc/user_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserData> {
  UserCubit() : super(UserData(cartItems: [], email: '', userId: ''));
  bool isUserLoggedIn = false;
  void loginUser(UserData user) {
    isUserLoggedIn = true;
    emit(user);
  }

  void logoutUser() {
    isUserLoggedIn = false;
    emit(UserData(cartItems: [], userId: '', email: ''));
  }
}
