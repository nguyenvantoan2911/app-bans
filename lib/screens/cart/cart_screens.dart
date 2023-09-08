import 'package:app/screens/cart/cart_widget.dart';
import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CartScreens extends StatelessWidget {
  const CartScreens({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Color color = utils.color;
    final size = utils.getscreenSize;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Cart (2)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 167, 227, 235)),
                child: Icon(
                  Icons.delete,
                  color: color,
                ))
          ]),
      body: Column(
        children: [
          _CheckOut(context: context),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CartWidget();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _CheckOut({required BuildContext context}) {
    Utils utils = Utils(context);
    Color color = utils.color;
    final size = utils.getscreenSize;
    return Container(
      width: double.infinity,
      height: size.height * 0.1,
      color: Colors.amber[100],
      child: Row(
        children: [
          Material(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextWidget(
                    text: 'Order Now', color: color, texSize: FontStyle.italic),
              ),
            ),
          ),
          const Spacer(),
          TextWidget(
              text: 'tolte : \$0.245',
              color: Colors.red,
              texSize: FontStyle.italic)
        ],
      ),
    );
  }
}
