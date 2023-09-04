import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OnSaleWidget extends StatefulWidget {
  OnSaleWidget(
      {super.key,
      required this.images,
      required this.name,
      required this.giagoc,
      required this.giamgia});
  late String images;
  late String name;
  late String giagoc;
  late String giamgia;
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
              color: Colors.pink[70],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: size.height * 0.15,
                        width: size.width * 0.17,
                        child: Image.asset(widget.images),
                      )),
                  Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                          text: widget.name,
                          color: Colors.black,
                          texSize: FontStyle.italic),
                      const SizedBox(
                        height: 5,
                      ),
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
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                          text: 'Giá :',
                          color: Colors.black,
                          texSize: FontStyle.normal),
                      const SizedBox(
                        height: 5,
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            TextWidget(
                                text: widget.giagoc,
                                color: const Color.fromARGB(255, 218, 49, 49),
                                texSize: FontStyle.normal),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              ' ${widget.giamgia}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
