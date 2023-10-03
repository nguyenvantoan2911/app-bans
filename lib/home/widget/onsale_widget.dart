import 'package:app/onsale_screen/onsale_screen/cooking_page.dart';
import 'package:app/onsale_screen/onsale_screen/food_page.dart';
import 'package:app/onsale_screen/onsale_screen/fruit_page.dart';
import 'package:app/onsale_screen/onsale_screen/vagetable_page.dart';
import 'package:app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OnSaleWidget extends StatefulWidget {
  OnSaleWidget({
    super.key,
    required this.images,
    required this.name,
  });
  late String images;
  late String name;

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getscreenSize;

    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {},
          child: Column(children: [
            SizedBox(
              width: size.width * 0.48,
              height: size.height * 0.23,
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: size.height * 0.13,
                        width: size.width * 0.4,
                        child: Image.asset(widget.images),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                        child: Icon(
                          IconlyLight.heart,
                          size: 27,
                          color: isLiked ? Colors.red : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: Colors.transparent),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 164, 70, 128)),
                      onPressed: () {
                        if (widget.name == 'Food') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FoodSecreen();
                          }));
                        } else if (widget.name == 'Snacks') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return VagetableScreen();
                          }));
                        } else if (widget.name == 'Spices') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CookingSpicesScreen();
                          }));
                        } else if (widget.name == 'Vegetable') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return VagetableScreen();
                          }));
                        } else if (widget.name == 'Fruit') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FruitScreen();
                          }));
                        }
                      },
                      child: const Text(
                        'See Details',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
