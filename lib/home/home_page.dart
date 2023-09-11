import 'package:app/home/widget/newproduct_widget.dart';
import 'package:app/home/widget/onsale_widget.dart';
import 'package:app/browse_screen/browse_screen.dart';
import 'package:app/services/Global_methods.dart';
import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Home_screens extends StatefulWidget {
  const Home_screens({super.key});

  @override
  State<Home_screens> createState() => __Home_screensState();
}

class __Home_screensState extends State<Home_screens> {
  final List<String> __offerImages = [
    'assets/landing/buyfood.jpg',
    'assets/landing/grocery-cart.jpg',
    'assets/landing/store.jpg',
    'assets/landing/vergtablebg.jpg'
  ];
  List<Map<String, dynamic>> ListOnSale = [
    {
      'name': 'lương thực',
      'images': 'assets/cart/grains.png',
    },
    {
      'name': 'đồ ăn vặt',
      'images': 'assets/cart/nuts.png',
    },
    {
      'name': 'gia vị',
      'images': 'assets/cart/spices.png',
    },
    {
      'name': 'rau',
      'images': 'assets/cart/Spinach.png',
    },
    {
      'name': 'củ quả',
      'images': 'assets/cart/veg.png',
    },
  ];
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
    GlobalMethods globalMethods = GlobalMethods();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.3,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  __offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: __offerImages.length,
              pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.red)),
              autoplay: true,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: TextWidget(
                  text: 'View All',
                  color: themeState
                      ? Colors.yellow
                      : Color.fromARGB(255, 213, 135, 161),
                  texSize: FontStyle.normal)),
          Row(
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Row(
                  children: [
                    TextWidget(
                        text: 'On sale'.toUpperCase(),
                        color: Colors.red,
                        texSize: FontStyle.normal),
                    const Icon(IconlyLight.discount)
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: size.height * 0.18,
                  child: ListView.builder(
                      itemCount: ListOnSale.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OnSaleWidget(
                          images: ListOnSale[index]['images'],
                          name: ListOnSale[index]['name'],
                        );
                      }),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                    text: 'Our Products',
                    color: themeState
                        ? Color.fromARGB(255, 155, 232, 30)
                        : Color.fromARGB(255, 33, 214, 160),
                    texSize: FontStyle.normal),
                TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          context: context, routeName: FeedScreens.routeName);
                    },
                    child: TextWidget(
                        text: 'Browse all',
                        color: themeState
                            ? Colors.yellow
                            : Color.fromARGB(255, 213, 135, 161),
                        texSize: FontStyle.italic)),
              ],
            ),
          ),
          Expanded(
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
          )
        ],
      ),
    );
  }
}
