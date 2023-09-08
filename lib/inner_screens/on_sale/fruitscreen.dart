import 'package:app/services/utils.dart';
import 'package:app/widgets/onsale_widget/sale_on_widget.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class FruitScreen extends StatelessWidget {
  FruitScreen({super.key});
  List<Map<String, dynamic>> listfruit = [
    {
      'image': 'assets/fruit/củ/cà_rốt-removebg-preview.png',
      'name': 'Củ Cà Rốt',
      'gia': '15000đ',
      'soluong': '2k'
    },
    {
      'image': 'assets/fruit/củ/cà_tím-removebg-preview.png',
      'name': 'Quả cà tím',
      'gia': '21000đ',
      'soluong': '1k'
    },
    {
      'image': 'assets/fruit/củ/chôm_chôm-removebg-preview.png',
      'name': 'Quả chôm chôm',
      'gia': '40000',
      'soluong': '2k'
    },
    {
      'image': 'assets/fruit/củ/củ_cải-removebg-preview.png',
      'name': 'Củ cải đường',
      'gia': '13000đ',
      'soluong': '400'
    },
    {
      'image': 'assets/fruit/củ/củ_đâu-removebg-preview.png',
      'name': 'Củ đậu',
      'gia': '5000',
      'soluong': '200'
    },
    {
      'image': 'assets/fruit/củ/củ_hành-removebg-preview.png',
      'name': 'Củ hành tây',
      'gia': '13000đ',
      'soluong': '800'
    },
    {
      'image': 'assets/fruit/củ/đào-removebg-preview.png',
      'name': 'Quả đào',
      'gia': '25000đ',
      'soluong': '2,2k'
    },
    {
      'image': 'assets/fruit/củ/mận-removebg-preview.png',
      'name': 'Quả mận',
      'gia': '30000đ',
      'soluong': '900'
    },
    {
      'image': 'assets/fruit/củ/mít-removebg-preview.png',
      'name': 'Quả mít',
      'gia': '9000đ',
      'soluong': '1,4k'
    },
    {
      'image': 'assets/fruit/củ/quả_táo-removebg-preview.png',
      'name': 'Quả táo',
      'gia': '13000đ',
      'soluong': '400'
    },
    {
      'image': 'assets/fruit/củ/tải_xuống__1_-removebg-preview.png',
      'name': 'Quả lê',
      'gia': '23000',
      'soluong': '1k'
    },
    {
      'image': 'assets/fruit/củ/tỏi-removebg-preview.png',
      'name': 'Củ tỏi',
      'gia': '14000đ',
      'soluong': '1,6k'
    },
    {
      'image': 'assets/fruit/củ/vải-removebg-preview (1).png',
      'name': 'Quả vải',
      'gia': '17000',
      'soluong': '1,1k'
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
              text: 'Fruit', color: Colors.black, texSize: FontStyle.normal),
        ),
        body: Container(
          child: GridView.count(
              shrinkWrap: false,
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.52),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(listfruit.length, (index) {
                return vagetableWidget(
                  gia: listfruit[index]['gia'],
                  name: listfruit[index]['name'],
                  image: listfruit[index]['image'],
                  soluong: listfruit[index]['soluong'],
                );
              })),
        ));
  }
}
