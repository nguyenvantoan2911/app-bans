// ignore_for_file: dead_code

import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../services/utils.dart';
import '../widgets/feed_items.dart';

class SaleViewAll extends StatelessWidget {
  static const RouteName = "SaleViewAll";
  const SaleViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    bool _isEmpty = false;
    Size size = utils.getscreenSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: TextWidget(
            text: 'siêu sale sale 20/8',
            color: Colors.red,
            texSize: FontStyle.italic),
      ),
      body: _isEmpty
          ? Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('asset/image/bag_wish.png'),
                  ),
                  Center(
                    child: TextWidget(
                        text: 'inventory is out',
                        color: Colors.black,
                        texSize: FontStyle.italic),
                  ),
                ],
              ),
            )
          : GridView.count(
              shrinkWrap: false,
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.53),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(50, (index) {
                return const FeedWidget();
              })),
    );
  }
}
