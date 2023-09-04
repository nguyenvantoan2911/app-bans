import 'package:app/inner_screens/feed_screens.dart';
import 'package:app/screens/home_screens/home_products.dart';
import 'package:app/services/Global_methods.dart';
import 'package:app/services/utils.dart';
import 'package:app/inner_screens/sale_view_all.dart';

import 'package:app/widgets/on_sale_widget.dart';
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
      'giagoc': '134&',
      'giamgia': '238&'
    },
    {
      'name': 'đồ ăn vặt',
      'images': 'assets/cart/nuts.png',
      'giagoc': '134&',
      'giamgia': '238&'
    },
    {
      'name': 'ngũ vị',
      'images': 'assets/cart/spices.png',
      'giagoc': '134&',
      'giamgia': '238&'
    },
    {
      'name': 'rau',
      'images': 'assets/cart/Spinach.png',
      'giagoc': '134&',
      'giamgia': '238&'
    },
    {
      'name': 'củ quả',
      'images': 'assets/cart/veg.png',
      'giagoc': '134&',
      'giamgia': '238&'
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
              onPressed: () {
                GlobalMethods.navigateTo(
                    context: context, routeName: SaleViewAll.RouteName);
              },
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
                  height: size.height * 0.15,
                  child: ListView.builder(
                      itemCount: ListOnSale.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OnSaleWidget(
                            images: ListOnSale[index]['images'],
                            name: ListOnSale[index]['name'],
                            giagoc: ListOnSale[index]['giagoc'],
                            giamgia: ListOnSale[index]['giamgia']);
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
          const HomeProducts()
        ],
      ),
    );
  }
}
