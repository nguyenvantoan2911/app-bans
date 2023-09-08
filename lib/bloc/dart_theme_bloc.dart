import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeCubit extends Cubit<bool> {
  DarkThemeCubit() : super(false);
  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = !state;
    await prefs.setBool('isDarkMode', isDarkMode);
    emit(isDarkMode);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(isDarkMode);
  }
}
