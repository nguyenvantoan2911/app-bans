import 'package:app/bloc/cart_cubit.dart';
import 'package:app/provider/dark_theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CartScreens extends StatelessWidget {
  CartScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final cartItems = cartCubit.state;
    final themeData = Provider.of<DarkThemeProvider>(context);
    final themeStates = themeData.getDarkTheme;
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final product = cartItems[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 1, right: 3, left: 3, top: 2),
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
                    child: const Icon(Icons.delete),
                  ),
                ],
              )),
        );
      },
    );
  }
}
