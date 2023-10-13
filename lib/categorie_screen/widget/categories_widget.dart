import 'package:app/cart/bloc/cart_cubit.dart';
import 'package:app/cart/state/products_state.dart';
import 'package:app/purchase/purchase_screen.dart';
import 'package:app/services/utils.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../provider/dark_theme_provider.dart';

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.gia,
      required this.soluong});
  late String image, name;

  late String gia, soluong;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  bool isLiked = false;
  bool isAddedToCart = false;
  void checkIfAddedToCart() {
    final cartCubit = context.read<CartCubit>();
    for (var item in cartCubit.state.items) {
      if (item.name == widget.name) {
        setState(() {
          isAddedToCart = true;
        });
        return;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkIfAddedToCart();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final themeStates = themeState.getDarkTheme;
    double screenWith = MediaQuery.of(context).size.width;
    Utils utils = Utils(context);
    final size = utils.getscreenSize;
    bool isdark = themeState.getDarkTheme;
    final cartCubit = context.watch<CartCubit>();
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 241, 215, 224),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(children: [
          Container(
            height: screenWith * 0.28,
            width: screenWith * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(widget.image))),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextWidget(
                text: widget.name,
                color: themeState.getDarkTheme ? Colors.black : Colors.black,
                texSize: FontStyle.italic,
                isTile: false,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!isAddedToCart) {
                        var productToAdd = ProductsState(
                          image: widget.image,
                          name: widget.name,
                          gia: widget.gia,
                        );
                        cartCubit.addToCart(productToAdd);
                        setState(() {
                          isAddedToCart = true;
                        });
                      }
                    },
                    child: Icon(
                      IconlyLight.bag2,
                      size: 22,
                      color: isAddedToCart ? Colors.red : Colors.black,
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
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Giá :',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.gia}đ',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                ' đã bán${widget.soluong}+',
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 232, 234, 113)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PurchaseScreen(
                      name: widget.name,
                      image: widget.image,
                      soluong: widget.soluong,
                      sotien: widget.gia);
                }));
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text(
                'Mua Ngay',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ))
        ]),
      ),
    );
  }
}
