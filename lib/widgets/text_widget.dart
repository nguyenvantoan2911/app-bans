import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final FontStyle texSize;

  bool isTile;
  int maxLines = 10;
  TextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.texSize,
      this.isTile = false,
      this.maxLines = 10});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
          color: color,
          fontSize: 18,
          fontStyle: texSize,
          fontWeight: isTile ? FontWeight.normal : FontWeight.bold),
    );
  }
}
