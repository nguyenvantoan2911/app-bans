import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProducts extends Cubit<List<Map<String, dynamic>>> {
  BlocProducts() : super([]);
  void updataDisplayedProducts(List<Map<String, dynamic>> products) {
    emit(products);
  }
}
