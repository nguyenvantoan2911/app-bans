import 'package:app/cart/bloc/cart_cubit.dart';
import 'package:app/cart/cart_screens.dart';
import 'package:app/cart/state/cart_state.dart';
import 'package:app/home/home_page.dart';
import 'package:app/categorie_screen/categories.dart';
import 'package:app/user_screen/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const Home_screens(), 'tile': 'Home Page'},
    {'page': CategoriesScreen(), 'tile': 'List Of Products'},
    {'page': const CartScreen(), 'tile': 'Shopping Cart'},
    {'page': const UserScreen(), 'tile': 'Personal Information'},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isdark = themeState.getDarkTheme;
    var isTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isdark
            ? const Color.fromARGB(135, 214, 4, 151)
            : isTheme.canvasColor,
        title: Text(
          _pages[_selectedIndex]['tile'],
          style: TextStyle(color: isdark ? Colors.amber : Colors.red),
        ),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: isdark
              ? const Color.fromARGB(135, 226, 17, 163)
              : isTheme.canvasColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          unselectedItemColor: isdark ? Colors.amber : Colors.red,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 0 ? IconlyLight.home : IconlyLight.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1
                    ? IconlyLight.category
                    : IconlyLight.category),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                  return Stack(children: [
                    Icon(_selectedIndex == 2
                        ? IconlyLight.buy
                        : IconlyLight.buy),
                    Positioned(
                      right: -0.5,
                      top: -1,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Center(
                          child: Text(
                            state.cartItemCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                }),
                label: 'Shopping Cart'),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 0
                    ? IconlyLight.user2
                    : IconlyLight.user2),
                label: 'Me'),
          ]),
    );
  }
}
