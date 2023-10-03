import 'package:app/cart/bloc/cart_cubit.dart';
import 'package:app/cart/state/products_state.dart';
import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class vagetableWidget extends StatefulWidget {
  final String gia;

  final String name;

  final String image, soluong;

  const vagetableWidget(
      {super.key,
      required this.gia,
      required this.name,
      required this.image,
      required this.soluong});

  @override
  State<vagetableWidget> createState() => _vagetableWidgetState();
}

class _vagetableWidgetState extends State<vagetableWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    final themeStates = themeData.getDarkTheme;
    Utils utils = Utils(context);
    double screenWith = MediaQuery.of(context).size.width;
    Color color = utils.color;
    final cartCubit = context.watch<CartCubit>();
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Color.fromARGB(255, 246, 231, 185)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Container(
              height: screenWith * 0.25,
              width: screenWith * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(widget.image))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        var productToAdd = ProductsState(
                          image: widget.image,
                          name: widget.name,
                          gia: widget.gia,
                        );
                        cartCubit.addToCart(productToAdd);
                      },
                      child: Icon(
                        IconlyLight.bag2,
                        size: 22,
                        color: themeStates ? Colors.white : Colors.black,
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
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Giá: ${widget.gia}đ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'đã bán${widget.soluong}+',
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    backgroundColor: const Color.fromARGB(255, 164, 70, 128)),
                onPressed: () {},
                child: const Text(
                  'Mua Ngay',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
