import 'package:app/services/utils.dart';
import 'package:app/widgets/heart_btn.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    final themeStates = themeData.getDarkTheme;
    Utils utils = Utils(context);
    double _screenWith = MediaQuery.of(context).size.width;
    Color color = utils.color;

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
              height: _screenWith * 0.3,
              width: _screenWith * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(widget.image))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                    text: widget.name,
                    color: Colors.black,
                    texSize: FontStyle.italic),
                HeartBTN()
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                      text: 'Giá:',
                      color: Colors.black,
                      texSize: FontStyle.normal),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.gia,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 247, 59, 46),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
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
            TextButton(
                onPressed: () {},
                child: TextWidget(
                    text: 'Mua ngay',
                    color: Color.fromARGB(255, 82, 143, 235),
                    texSize: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}
