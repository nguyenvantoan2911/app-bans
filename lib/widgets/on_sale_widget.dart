import 'package:app/inner_screens/on_sale/cooking_spices_screen.dart';
import 'package:app/inner_screens/on_sale/food.dart';
import 'package:app/inner_screens/on_sale/fruitscreen.dart';
import 'package:app/inner_screens/on_sale/vagetable_screen.dart';
import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
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
            Container(
              width: size.width * 0.4,
              height: size.height * 0.165,
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.35,
                        child: Image.asset(widget.images),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWidget(
                          text: widget.name,
                          color: Colors.black,
                          texSize: FontStyle.italic),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              IconlyLight.bag2,
                              size: 22,
                              color: Colors.black,
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.2,
                  ),
                  TextButton(
                      onPressed: () {
                        if (widget.name == 'lương thực') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FoodSecreen();
                          }));
                        } else if (widget.name == 'đồ ăn vặt') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return VagetableScreen();
                          }));
                        } else if (widget.name == 'gia vị') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CookingSpicesScreen();
                          }));
                        } else if (widget.name == 'rau') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return VagetableScreen();
                          }));
                        } else if (widget.name == 'củ quả') {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FruitScreen();
                          }));
                        }
                      },
                      child: const Text(
                        'Mua Ngay',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 191, 32, 227)),
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
