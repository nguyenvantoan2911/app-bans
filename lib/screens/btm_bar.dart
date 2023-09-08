import 'package:app/screens/cart.dart';
import 'package:app/screens/categories.dart';
import 'package:app/screens/home_screens/home_page.dart';
import 'package:app/screens/user.dart';
import 'package:flutter/material.dart';
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
    {'page': const Home_screens(), 'tile': 'Trang Chủ'},
    {'page': CategoriesScreen(), 'tile': 'CategoriesScreen'},
    {'page': const CartScreen(), 'tile': 'CartScreen'},
    {'page': const UserScreen(), 'tile': 'UserScreen'},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isdark = themeState.getDarkTheme;
    var _isTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            _isdark ? Color.fromARGB(135, 214, 4, 151) : _isTheme.canvasColor,
        title: Text(
          _pages[_selectedIndex]['tile'],
          style: TextStyle(color: _isdark ? Colors.amber : Colors.red),
        ),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: _isdark
              ? Color.fromARGB(135, 226, 17, 163)
              : _isTheme.canvasColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          unselectedItemColor: _isdark ? Colors.amber : Colors.red,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 0 ? IconlyLight.home : IconlyLight.home),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1
                    ? IconlyLight.category
                    : IconlyLight.category),
                label: 'category'),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 2 ? IconlyLight.buy : IconlyLight.buy),
                label: 'buy'),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 0
                    ? IconlyLight.user2
                    : IconlyLight.user2),
                label: 'users'),
          ]),
    );
  }
}
