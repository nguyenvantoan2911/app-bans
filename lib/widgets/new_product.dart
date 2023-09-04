import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/services/utils.dart';
import 'package:app/widgets/heart_btn.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewProduct extends StatefulWidget {
  NewProduct(
      {super.key,
      required this.images,
      required this.names,
      required this.gia,
      required this.giasoc});
  final String images, names, gia, giasoc;
  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<DarkThemeProvider>(context);
    final themeStates = themeData.getDarkTheme;
    Utils utils = Utils(context);
    double _screenWith = MediaQuery.of(context).size.width;
    Color color = utils.color;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Color.fromARGB(255, 244, 224, 164)),
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
                  image: DecorationImage(image: AssetImage(widget.images))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                    text: widget.names,
                    color: Colors.black,
                    texSize: FontStyle.italic),
                HeartBTN()
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  TextWidget(
                      text: 'Giá:',
                      color: Colors.black,
                      texSize: FontStyle.normal),
                  const SizedBox(
                    width: 5,
                  ),
                  TextWidget(
                      text: widget.giasoc,
                      color: Colors.red,
                      texSize: FontStyle.normal),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.gia,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {},
                child: TextWidget(
                    text: 'Add to card',
                    color: Colors.black,
                    texSize: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}
