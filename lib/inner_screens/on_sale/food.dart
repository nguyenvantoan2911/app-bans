import 'package:app/services/utils.dart';
import 'package:app/widgets/onsale_widget/sale_on_widget.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class FoodSecreen extends StatelessWidget {
  FoodSecreen({super.key});
  List<Map<String, dynamic>> listfood = [
    {
      'image': 'assets/food/lương thực/gạo_trắng-removebg-preview.png',
      'name': 'Gạo Trắng',
      'gia': '50000đ',
      'soluong': '10k'
    },
    {
      'image': 'assets/food/lương thực/khoai_lang-removebg-preview.png',
      'name': 'Khoai Lang',
      'gia': '25000đ',
      'soluong': '6k'
    },
    {
      'image': 'assets/food/lương thực/khoai_môn-removebg-preview.png',
      'name': 'Khoai Môn',
      'gia': '15000đ',
      'soluong': '2,1k'
    },
    {
      'image': 'assets/food/lương thực/khoai_tây-removebg-preview.png',
      'name': 'Khoai Tây',
      'gia': '18000đ',
      'soluong': '1,2k'
    },
    {
      'image': 'assets/food/lương thực/ngô-removebg-preview.png',
      'name': 'Ngô',
      'gia': '30000đ',
      'soluong': '1,8k'
    },
    {
      'image': 'assets/food/lương thực/sắn_ta-removebg-preview.png',
      'name': 'Sắn',
      'gia': '23000đ',
      'soluong': '4k'
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
              children: List.generate(listfood.length, (index) {
                return vagetableWidget(
                  gia: listfood[index]['gia'],
                  name: listfood[index]['name'],
                  image: listfood[index]['image'],
                  soluong: listfood[index]['soluong'],
                );
              })),
        ));
  }
}
