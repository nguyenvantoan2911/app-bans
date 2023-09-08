import 'package:app/widgets/categories_widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  List<Map<String, dynamic>> user = [
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
    {
      'image': 'assets/food/lương thực/sắn_ta-removebg-preview.png',
      'name': 'Sắn',
      'gia': '23000đ',
      'soluong': '4k'
    },
    {
      'image': 'assets/vegetable list/rau. /cải_canh-removebg-preview.png',
      'name': 'Rau Cải Canh',
      'gia': '2000đ',
      'soluong': '2,3k'
    },
    {
      'image': 'assets/vegetable list/rau. /cải_thìa-removebg-preview.png',
      'name': 'Rau Cải Thìa',
      'gia': '2500đ',
      'soluong': '1k'
    },
    {
      'image': 'assets/vegetable list/rau. /mướp_đắng-removebg-preview.png',
      'name': 'Rau Mướp Đắng',
      'gia': '1500đ',
      'soluong': '2,1k'
    },
    {
      'image': 'assets/vegetable list/rau. /rau_chân_vịt-removebg-preview.png',
      'name': 'Rau Chân Vịt',
      'gia': '1000đ',
      'soluong': '1,2k'
    },
    {
      'image': 'assets/vegetable list/rau. /rau_đay-removebg-preview.png',
      'name': 'Rau Đay',
      'gia': '2150đ',
      'soluong': '1,6k'
    },
    {
      'image': 'assets/vegetable list/rau. /rau_muong-removebg.png',
      'name': 'Rau Muống',
      'gia': '1000đ',
      'soluong': '500'
    },
    {
      'image': 'assets/vegetable list/rau. /rau_xa_nach-removebg-preview.png',
      'name': 'Rau Xà Nách',
      'gia': '500đ',
      'soluong': '800'
    },
    {
      'image': 'assets/vegetable list/rau. /su_hào-removebg-preview.png',
      'name': 'Rau Xu Hào',
      'gia': '5000đ',
      'soluong': '1,4k'
    },
    {
      'image': 'assets/vegetable list/rau. /supno-removebg-preview.png',
      'name': 'Rau Súp Nơ',
      'gia': '4000đ',
      'soluong': '2,2k'
    },
    {
      'image': 'assets/vegetable list/rau. /tải_xuống-removebg-preview.png',
      'name': 'Rau Ngót',
      'gia': '3000đ',
      'soluong': '3k'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        childAspectRatio: 50 / 60,
        crossAxisSpacing: 13,
        mainAxisSpacing: 13,
        children: List.generate(user.length, (index) {
          return CategoriesWidget(
              image: user[index]['image'],
              name: user[index]['name'],
              gia: user[index]['gia'],
              soluong: user[index]['soluong']);
        }),
      ),
    );
  }
}
