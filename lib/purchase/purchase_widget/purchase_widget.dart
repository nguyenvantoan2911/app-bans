import 'package:app/purchase/purchase_widget/purchase_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Center(
          child: Icon(
        Icons.more_vert,
        size: 35,
      )),
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => const ListItems(),
          onPop: () => print('Popover was popped!'),
          direction: PopoverDirection.bottom,
          backgroundColor: Colors.white,
          width: 250,
          height: 200,
          arrowHeight: 15,
          arrowWidth: 30,
        );
      },
    );
  }
}
