import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);

    Color color = utils.color;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(text: 'Giá :', color: color, texSize: FontStyle.normal),
          const SizedBox(
            width: 10,
          ),
          TextWidget(
              text: '200&',
              color: Color.fromARGB(255, 218, 49, 49),
              texSize: FontStyle.normal),
          const SizedBox(
            width: 10,
          ),
          const Text(
            '150&',
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.lineThrough,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
