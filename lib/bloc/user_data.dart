import 'package:app/bloc/products_state.dart';

class UserData {
  final String userId;
  final String email;
  final List<ProductsState> cartItems;
  UserData(
      {required this.email, required this.cartItems, required this.userId});
}
