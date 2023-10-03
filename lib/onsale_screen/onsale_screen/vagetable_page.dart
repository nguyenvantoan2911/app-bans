import 'package:app/onsale_screen/onsale_screen/widgets/onsale_widget.dart';
import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class VagetableScreen extends StatelessWidget {
  VagetableScreen({super.key});
  List<Map<String, dynamic>> listvagetable = [
    {
      'image': 'assets/vegetable list/rau. /cải_canh-removebg-preview.png',
      'name': 'Rau Cải Canh',
      'gia': '2000',
      'soluong': '2,3k'
    },
    {
      'image': 'assets/vegetable list/rau. /cải_thìa-removebg-preview.png',
      'name': 'Rau Cải Thìa',
      'gia': '2500',
      'soluong': '1k'
    },
    {
      'image': 'assets/vegetable list/rau. /mướp_đắng-removebg-preview.png',
      'name': 'Rau Mướp Đắng',
      'gia': '1500',
      'soluong': '2,1k'
    },
    {
      'image': 'assets/vegetable list/rau. /rau_chân_vịt-removebg-preview.png',
      'name': 'Rau Chân Vịt',
      'gia': '1000',
      'soluong': '1,2k'
    },
    {
      'image': 'assets/vegetable list/rau. /rau_đay-removebg-preview.png',
      'name': 'Rau Đay',
      'gia': '2150',
      'soluong': '1,6k'
    },
    {
      'image': 'assets/vegetable list/rau. /rau_muong-removebg.png',
      'name': 'Rau Muống',
      'gia': '1000',
      'soluong': '500'
    },
    {
      'image': 'assets/vegetable list/rau. /rau_xa_nach-removebg-preview.png',
      'name': 'Rau Xà Nách',
      'gia': '500',
      'soluong': '800'
    },
    {
      'image': 'assets/vegetable list/rau. /su_hào-removebg-preview.png',
      'name': 'Rau Xu Hào',
      'gia': '5000',
      'soluong': '1,4k'
    },
    {
      'image': 'assets/vegetable list/rau. /supno-removebg-preview.png',
      'name': 'Rau Súp Nơ',
      'gia': '4000',
      'soluong': '2,2k'
    },
    {
      'image': 'assets/vegetable list/rau. /tải_xuống-removebg-preview.png',
      'name': 'Rau Ngót',
      'gia': '3000',
      'soluong': '3k'
    },
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getscreenSize;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 158, 152),
          title: TextWidget(
              text: 'Vagetable',
              color: Colors.black,
              texSize: FontStyle.normal),
        ),
        body: Container(
          child: GridView.count(
              shrinkWrap: false,
              padding: const EdgeInsets.all(5),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.5),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(listvagetable.length, (index) {
                return vagetableWidget(
                  gia: listvagetable[index]['gia'],
                  name: listvagetable[index]['name'],
                  image: listvagetable[index]['image'],
                  soluong: listvagetable[index]['soluong'],
                );
              })),
        ));
  }
}
