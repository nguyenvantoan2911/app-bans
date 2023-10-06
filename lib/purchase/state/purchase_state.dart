class PurchaseState {
  late int count;
  late int tonggia;
  PurchaseState({required this.count, required this.tonggia});
  PurchaseState copyWith({int? count, int? tonggia}) {
    return PurchaseState(
        count: count ?? this.count, tonggia: tonggia ?? this.tonggia);
  }
}
