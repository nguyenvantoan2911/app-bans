import 'package:app/cart/state/products_state.dart';

class CartState {
  late List<ProductsState> items;
  late int cartItemCount;
  late int tonggia;
  late int quantityCheckbox;
  late int totalPayment;
  bool isSelectAll;

  CartState({
    required this.items,
    required this.tonggia,
    required this.cartItemCount,
    required this.quantityCheckbox,
    required this.totalPayment,
    this.isSelectAll = false,
  });
  CartState copyWith({
    List<ProductsState>? items,
    int? tonggia,
    int? cartItemCount,
    int? quantityCheckbox,
    int? totalPayment,
    bool? isSelectAll,
  }) {
    return CartState(
        isSelectAll: isSelectAll ?? this.isSelectAll,
        totalPayment: totalPayment ?? this.totalPayment,
        quantityCheckbox: quantityCheckbox ?? this.quantityCheckbox,
        items: items ?? this.items,
        tonggia: tonggia ?? this.tonggia,
        cartItemCount: cartItemCount ?? this.cartItemCount);
  }
}
