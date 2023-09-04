import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class HeartBTN extends StatefulWidget {
  HeartBTN({super.key});

  @override
  State<HeartBTN> createState() => _HeartBTNState();
}

class _HeartBTNState extends State<HeartBTN> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isdark = themeState.getDarkTheme;
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Icon(
            IconlyLight.bag2,
            size: 22,
            color: _isdark ? Colors.white : Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
          child: Icon(
            IconlyLight.heart,
            size: 22,
            color: isLiked ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }
}
