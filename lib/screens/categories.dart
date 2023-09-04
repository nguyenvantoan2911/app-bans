import 'package:app/services/utils.dart';
import 'package:app/widgets/categories_widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  List<Map<String, dynamic>> user = [
    {
      'imagePhone': 'asset/sale phone/image.jpeg',
      'namePhone': ' Iphone 13',
      'monny': '123&',
      'mons': '100&'
    },
    {
      'imagePhone': 'asset/sale phone/galaxy note 8.jpeg',
      'namePhone': ' Galaxy Note 8',
      'monny': '123&',
      'mons': '100&'
    },
    {
      'imagePhone': 'asset/sale phone/galaxynote 10.jpeg',
      'namePhone': ' Galaxy Note 10',
      'monny': '123&',
      'mons': '100&'
    },
    {
      'imagePhone': 'asset/sale phone/ip11pro.jpeg',
      'namePhone': ' Iphone 11 pro',
      'monny': '123&',
      'mons': '100&'
    },
    {
      'imagePhone': 'asset/sale phone/Lg v5.jpeg',
      'namePhone': ' LG V5',
      'monny': '123&',
      'mons': '100&'
    },
    {
      'imagePhone': 'asset/sale phone/sony.jpeg',
      'namePhone': ' Sony',
      'monny': '123&',
      'mons': '100&'
    },
    {
      'imagePhone': 'asset/sale phone/xiaomi note8.jpeg',
      'namePhone': ' xiaomi note8.',
      'monny': '123&',
      'mons': '100&'
    },
  ];
  @override
  Widget build(BuildContext context) {
    Color color = Utils(context).color;
    final sixe = Utils(context).getscreenSize;
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        childAspectRatio: 50 / 60,
        crossAxisSpacing: 13,
        mainAxisSpacing: 13,
        children: List.generate(7, (index) {
          return CategoriesWidget(
            imagePhone: user[index]['imagePhone'],
            namePhone: user[index]['namePhone'],
            color: color,
            monny: user[index]['monny'],
            mons: user[index]['mons'],
          );
        }),
      ),
    );
  }
}
