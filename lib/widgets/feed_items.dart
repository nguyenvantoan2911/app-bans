import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({
    super.key,
  });

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    final size = utils.getscreenSize;
    Color color = utils.color;
    return Scaffold(
      body: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                child: FancyShimmerImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk_yonsM1tzk59bXWt20ykHjnBE_QfK-8X6A&usqp=CAU',
                  height: size.height * 0.13,
                  width: size.width * 0.45,
                  boxFit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                    text: 'Title', color: color, texSize: FontStyle.italic),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            TextButton(
                onPressed: () {},
                child: TextWidget(
                    text: 'Add to card',
                    color: color,
                    texSize: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}
