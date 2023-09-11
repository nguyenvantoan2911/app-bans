import 'package:flutter/material.dart';

class GoogleState extends StatelessWidget {
  const GoogleState({super.key, required this.images, required this.onPressed});
  final List<String> images;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: List.generate(images.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: onPressed,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(images[index]),
                backgroundColor: Colors.white,
              ),
            ),
          );
        }));
  }
}
