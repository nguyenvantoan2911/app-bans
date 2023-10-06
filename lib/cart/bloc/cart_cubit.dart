import 'package:app/cart/state/products_state.dart';
import 'package:app/cart/state/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : super(CartState(
            items: [],
            tonggia: 0,
            cartItemCount: 0,
            quantityCheckbox: 0,
            totalPayment: 0));

  void addToCart(ProductsState product) {
    state.items.add(product);
    emit(state.copyWith(
        items: List.from(state.items), cartItemCount: state.cartItemCount + 1));
  }

  void clearToCart(ProductsState product) {
    final updatedItems = List<ProductsState>.from(state.items);
    updatedItems.remove(product);
    final selectedCheckbox =
        updatedItems.where((item) => item.isSelected).length;
    int totalPayment = 0;
    for (final item in updatedItems) {
      if (item.isSelected) {
        totalPayment += item.count * int.parse(item.gia);
      }
    }
    emit(state.copyWith(
      items: updatedItems,
      cartItemCount: state.cartItemCount - 1,
      quantityCheckbox: selectedCheckbox,
      totalPayment: totalPayment,
    ));
  }

  void increase(ProductsState product) {
    final updatedItems = List<ProductsState>.from(state.items);
    for (int i = 0; i < updatedItems.length; i++) {
      if (updatedItems[i] == product) {
        updatedItems[i].count += 1;
        state.tonggia += int.parse(updatedItems[i].gia);
        if (updatedItems[i].isSelected) {
          state.totalPayment += int.parse(updatedItems[i].gia);
        }
        break;
      }
    }
    emit(state.copyWith(items: updatedItems, tonggia: state.tonggia));
  }

  void reduced(ProductsState product) {
    final updatedItems = List<ProductsState>.from(state.items);
    for (int i = 0; i < updatedItems.length; i++) {
      if (updatedItems[i] == product && updatedItems[i].count > 1) {
        updatedItems[i].count -= 1;
        state.tonggia -= int.parse(updatedItems[i].gia);
        if (updatedItems[i].isSelected) {
          state.totalPayment -= int.parse(updatedItems[i].gia);
        }
        break;
      }
    }
    emit(state.copyWith(items: updatedItems, tonggia: state.tonggia));
  }

  void checkBox(ProductsState products) {
    int totalPayment = 0;
    final updatedItems = List<ProductsState>.from(state.items);
    for (int i = 0; i < updatedItems.length; i++) {
      if (updatedItems[i] == products) {
        updatedItems[i].isSelected = !updatedItems[i].isSelected;
      }
      if (updatedItems[i].isSelected) {
        totalPayment += updatedItems[i].count * int.parse(updatedItems[i].gia);
      }
    }
    final selectedCheckbox =
        updatedItems.where((item) => item.isSelected).length;
    emit(state.copyWith(
      items: updatedItems,
      quantityCheckbox: selectedCheckbox,
      totalPayment: totalPayment,
    ));
  }

  void checkBoxAll(bool value) {
    final updatedItems = List<ProductsState>.from(state.items);
    for (int i = 0; i < updatedItems.length; i++) {
      updatedItems[i].isSelected = value;
    }
    int totalPayment = 0;
    if (value) {
      for (final item in updatedItems) {
        totalPayment += item.count * int.parse(item.gia);
      }
    } else {
      totalPayment = 0;
    }
    int selectedCheckbox = value ? updatedItems.length : 0;
    emit(state.copyWith(
        items: updatedItems,
        quantityCheckbox: selectedCheckbox,
        totalPayment: totalPayment,
        isSelectAll: value));
  }
}
