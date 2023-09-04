import 'package:app/services/utils.dart';
import 'package:app/widgets/new_product.dart';
import 'package:app/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class HomeProducts extends StatefulWidget {
  const HomeProducts({super.key});

  @override
  State<HomeProducts> createState() => _HomeProductsState();
}

class _HomeProductsState extends State<HomeProducts> {
  List<Map<String, dynamic>> user = [
    {
      'images': 'assets/vegetable list/rau. /rau_muong-removebg.png',
      'names': 'Rau muống',
      'gia': '1000\đ',
      'giasoc': '500\đ'
    },
    {
      'images': 'assets/vegetable list/rau. /rau_xa_nach-removebg-preview.png',
      'names': 'Rau xà nách',
      'gia': '500\đ',
      'giasoc': '300\đ'
    },
    {
      'images': 'assets/vegetable list/rau. /tải_xuống-removebg-preview.png',
      'names': 'Rau bắp cải',
      'gia': '2000\đ',
      'giasoc': '1500\đ'
    },
    {
      'images': 'assets/vegetable list/rau. /supno-removebg-preview.png',
      'names': 'Rau súp nơ',
      'gia': '4000\đ',
      'giasoc': '3000\đ'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getscreenSize;
    return Expanded(
      child: GridView.count(
          shrinkWrap: false,
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          childAspectRatio: size.width / (size.height * 0.53),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(user.length, (index) {
            return NewProduct(
                images: user[index]['images'],
                names: user[index]['names'],
                gia: user[index]['gia'],
                giasoc: user[index]['giasoc']);
          })),
    );
  }
}
