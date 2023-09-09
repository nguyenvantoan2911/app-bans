import 'package:app/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<ProductsState>> {
  CartCubit() : super([]);
  void addToCart(ProductsState product) {
    state.add(product);
    emit(List.from(state));
  }

  void clearToCart(ProductsState product) {
    state.remove(product);
    emit(List.from(state));
  }
}
