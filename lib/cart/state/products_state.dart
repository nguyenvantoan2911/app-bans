class ProductsState {
  late String gia;
  late String name;
  late String image;
  late int count;
  bool isSelected;

  ProductsState({
    this.isSelected = false,
    this.count = 1,
    required this.image,
    required this.name,
    required this.gia,
  });
}
