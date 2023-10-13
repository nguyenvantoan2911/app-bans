import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/purchase/bloc/purchase_bloc.dart';
import 'package:app/purchase/state/purchase_state.dart';
import 'package:app/purchase/purchase_widget/purchase_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.soluong,
      required this.sotien});
  final String name;
  final String image;
  final String soluong;
  final String sotien;

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  late bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final themeStates = themeState.getDarkTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 225, 206),
                  image: DecorationImage(image: AssetImage(widget.image)),
                ),
              ),
            ),
            Positioned(
                bottom: -25,
                left: 3,
                child: Image.asset(
                  'assets/landing/free ship.png',
                  width: 100,
                  height: 100,
                )),
            Positioned(
                top: 60,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    context.read<PurchaseBloc>().resetCount();

                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_sharp,
                    size: 30,
                    color: Colors.black,
                  ),
                )),
            Positioned(
                top: 60,
                right: 10,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Icon(
                        IconlyLight.heart,
                        size: 30,
                        color: isLiked ? Colors.red : Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Button()
                  ],
                )),
          ]),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Giá: ${widget.sotien}đ',
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/landing/chia_sẻ-removebg-preview.png',
                            width: 30,
                            height: 30,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/landing/mess-removebg-preview.png',
                            width: 40,
                            height: 35,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: Colors.black,
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                const Text(
                  'Đánh giá: 5.0s ',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.black),
                ),
                InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/landing/5sao-removebg-preview.png',
                      width: 110,
                      height: 45,
                    )),
                const SizedBox(
                  width: 70,
                ),
                Text(
                  'Đã bán ${widget.soluong}+',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          BlocBuilder<PurchaseBloc, PurchaseState>(builder: (context, state) {
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Row(
                children: [
                  _quantity(
                    color: Colors.cyan,
                    onTap: () {
                      context.read<PurchaseBloc>().giam(widget.sotien);
                    },
                    icon: CupertinoIcons.minus,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      '${state.count}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _quantity(
                    color: const Color.fromARGB(255, 124, 227, 56),
                    onTap: () {
                      context.read<PurchaseBloc>().tang(widget.sotien);
                    },
                    icon: CupertinoIcons.plus,
                  ),
                  const SizedBox(
                    width: 130,
                  ),
                  Expanded(
                      child: Text(
                    'Thanh Toán:\n=> ${state.tonggia}đ',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ))
                ],
              ),
            );
          }),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: const Color.fromARGB(255, 33, 226, 243),
                minimumSize: const Size(20, 50),
                fixedSize: const Size(130, 50),
              ),
              child: const Text(
                'Mua Hàng',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              )),
        ],
      ),
    );
  }

  Widget _quantity({
    required Color color,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
