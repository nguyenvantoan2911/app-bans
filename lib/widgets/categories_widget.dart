import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/dark_theme_provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {super.key,
      required this.imagePhone,
      required this.namePhone,
      required this.color,
      required this.monny,
      required this.mons});
  final String imagePhone, namePhone;
  final Color color;
  final String monny, mons;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final themeStates = themeState.getDarkTheme;
    double _screenWith = MediaQuery.of(context).size.width;
    Utils utils = Utils(context);
    final size = utils.getscreenSize;
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(
                color: themeStates ? Colors.black : Colors.red, width: 2)),
        child: Column(children: [
          Container(
            height: _screenWith * 0.3,
            width: _screenWith * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(imagePhone))),
          ),
          const SizedBox(
            height: 4,
          ),
          TextWidget(
            text: namePhone,
            color: themeState.getDarkTheme ? Colors.black : Colors.black,
            texSize: FontStyle.italic,
            isTile: false,
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                    text: monny, color: Colors.red, texSize: FontStyle.italic),
                Text(
                  mons,
                  style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
          )
        ]),
      ),
    );
  }
}
