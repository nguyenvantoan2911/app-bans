import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget(
      {super.key, required this.name, required this.image, required this.muny});
  final String name, image, muny;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    final size = utils.getscreenSize;
    Color color = utils.color;
    final themeStates = Provider.of<DarkThemeProvider>(context).getDarkTheme;

    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 145, 241, 234),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(
                color: themeStates ? Colors.black : Colors.red, width: 2)),
        child: Column(
          children: [
            Container(
              height: size.height * 0.15,
              width: size.width * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(widget.image))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                    text: widget.name,
                    color: Colors.black,
                    texSize: FontStyle.normal),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 4,
            ),
            TextWidget(
                text: 'Giá : ${widget.muny}',
                color: Colors.red,
                texSize: FontStyle.normal)
          ],
        ),
      ),
    );
  }
}
