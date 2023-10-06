import 'package:app/purchase/state/purchase_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseBloc extends Cubit<PurchaseState> {
  PurchaseBloc() : super(PurchaseState(count: 0, tonggia: 0));
  void tang(String gia) {
    emit(state.copyWith(
        count: state.count + 1, tonggia: (state.count + 1) * int.parse(gia)));
  }

  void giam(String gia) {
    if (state.count > 0) {
      emit(state.copyWith(
          count: state.count - 1, tonggia: (state.count - 1) * int.parse(gia)));
    }
  }

  void resetCount() {
    emit(state.copyWith(count: 0, tonggia: 0));
  }
}
