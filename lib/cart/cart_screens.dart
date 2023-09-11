import 'package:app/cart/bloc/cart_cubit.dart';
import 'package:app/provider/dark_theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final cartItems = cartCubit.state;
    final themeData = Provider.of<DarkThemeProvider>(context);
    final themeStates = themeData.getDarkTheme;
    if (cartItems.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/offres/ofres/box.png'))),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Chưa thêm sản phẩm vào giỏ hàng',
                style: TextStyle(
                    fontSize: 20,
                    color: themeStates ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];

          return Padding(
            padding:
                const EdgeInsets.only(bottom: 1, right: 3, left: 3, top: 2),
            child: ListTile(
                tileColor: themeStates
                    ? Color.fromARGB(255, 229, 192, 213)
                    : Color.fromARGB(255, 153, 240, 240),
                leading: Container(
                  height: 150,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(image: AssetImage(product.image))),
                ),
                title: Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Giá :${product.gia}',
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Chi Tiết',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 241, 78, 78),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartCubit.clearToCart(product);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                )),
          );
        },
      );
    }
  }
}
