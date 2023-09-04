import 'package:app/widgets/heart_btn.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/utils.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
 
  int count = 0;
  void tang() {
    setState(() {
      count++;
    });
  }

  void giam() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    final size = utils.getscreenSize;
    Color color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height * 0.110,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FancyShimmerImage(
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk_yonsM1tzk59bXWt20ykHjnBE_QfK-8X6A&usqp=CAU',
                          boxFit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextWidget(
                                text: 'title',
                                color: color,
                                texSize: FontStyle.italic),
                          ),
                          SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                _widget(
                                    onPressed: tang,
                                    color: Colors.red,
                                    icon: CupertinoIcons.plus),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$count',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                _widget(
                                    onPressed: giam,
                                    color: Colors.green,
                                    icon: CupertinoIcons.minus)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          HeartBTN(),
                          TextWidget(
                              text: '\$0.5',
                              color: color,
                              texSize: FontStyle.italic)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _widget(
      {required VoidCallback onPressed,
      required Color color,
      required IconData icon}) {
    return Flexible(
      flex: 2,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onPressed,
          child: Padding(padding: const EdgeInsets.all(3.0), child: Icon(icon)),
        ),
      ),
    );
  }
}
