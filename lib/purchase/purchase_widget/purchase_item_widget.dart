import 'package:flutter/material.dart';

class PurchaseItem extends StatelessWidget {
  final String name;
  final String image;
  final String soluong;
  final String sotien;

  const PurchaseItem({
    super.key,
    required this.name,
    required this.image,
    required this.soluong,
    required this.sotien,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.amber,
          child: Text(name),
        ),
        Container(
          color: Colors.red,
          child: Text(image),
        ),
        Container(
          color: Colors.blue,
          child: Text(soluong),
        ),
        Container(
          color: Colors.green,
          child: Text(sotien),
        ),
      ],
    );
  }
}
