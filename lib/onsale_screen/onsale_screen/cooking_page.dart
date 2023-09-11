import 'package:app/onsale_screen/onsale_screen/widgets/onsale_widget.dart';
import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CookingSpicesScreen extends StatelessWidget {
  CookingSpicesScreen({super.key});
  List<Map<String, dynamic>> listcookingspices = [
    {
      'image': 'assets/cooking_spices/bột_nêm-removebg-preview.png',
      'name': 'Bột Nêm',
      'gia': '30000đ',
      'soluong': '2,3k'
    },
    {
      'image': 'assets/cooking_spices/bột_ớt-removebg-preview.png',
      'name': 'Ớt Bột',
      'gia': '22000đ',
      'soluong': '300'
    },
    {
      'image': 'assets/cooking_spices/mam_cá_sinh-removebg-preview.png',
      'name': 'Mắm Cá Sinh',
      'gia': '15000đ',
      'soluong': '2k'
    },
    {
      'image': 'assets/cooking_spices/mayonnaise-removebg-preview.png',
      'name': 'Mayonnaise',
      'gia': '13000đ',
      'soluong': '1,1k'
    },
    {
      'image': 'assets/cooking_spices/mắn_nam_ngư-removebg-preview.png',
      'name': 'Mắm Nam Ngư',
      'gia': '27000đ',
      'soluong': '1k'
    },
    {
      'image': 'assets/cooking_spices/mắn_tôm-removebg-preview.png',
      'name': 'Mắm Tôm',
      'gia': '15000đ',
      'soluong': '200'
    },
    {
      'image': 'assets/cooking_spices/mì_chính-removebg-preview.png',
      'name': 'Mì Chính',
      'gia': '21000đ',
      'soluong': '2,5k'
    },
    {
      'image': 'assets/cooking_spices/muoi-removebg-preview.png',
      'name': 'Muối I Ốt',
      'gia': '3000đ',
      'soluong': '370'
    },
    {
      'image': 'assets/cooking_spices/muoihaohao-removebg-preview.png',
      'name': 'Muối Hảo Hảo',
      'gia': '10000đ',
      'soluong': '2,1k'
    },
    {
      'image': 'assets/cooking_spices/ngũ_vị_hương-removebg-preview.png',
      'name': 'Ngũ Vị Hương',
      'gia': '1000đ',
      'soluong': '400'
    },
    {
      'image': 'assets/cooking_spices/tương_bần-removebg-preview.png',
      'name': 'Tương Bần',
      'gia': '11000đ',
      'soluong': '1k'
    },
    {
      'image': 'assets/cooking_spices/tương_cà-removebg-preview.png',
      'name': 'Tương cà',
      'gia': '14000đ',
      'soluong': '3,4k'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getscreenSize;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 158, 152),
          title: TextWidget(
              text: 'Vagetable',
              color: Colors.black,
              texSize: FontStyle.normal),
        ),
        body: Container(
          child: GridView.count(
              shrinkWrap: false,
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.52),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(listcookingspices.length, (index) {
                final product = listcookingspices[index];
                return vagetableWidget(
                  gia: product['gia'],
                  name: product['name'],
                  image: product['image'],
                  soluong: product['soluong'],
                );
              })),
        ));
  }
}
