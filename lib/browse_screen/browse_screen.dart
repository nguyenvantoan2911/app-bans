import 'package:app/browse_screen/bloc/bloc_products.dart';
import 'package:app/services/utils.dart';
import 'package:app/browse_screen/browse_widget/browse_widget.dart';
import 'package:app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreens extends StatefulWidget {
  static const routeName = 'FeedScreens';

  const FeedScreens({super.key});

  @override
  State<FeedScreens> createState() => _FeedScreensState();
}

class _FeedScreensState extends State<FeedScreens> {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusnode = FocusNode();
  late BlocProducts _blocProducts = BlocProducts();
  List<Map<String, dynamic>> user = [
    {'name': 'lương thực', 'image': 'assets/cart/grains.png', 'muny': '100\$'},
    {'name': 'đồ ăn vặt', 'image': 'assets/cart/nuts.png', 'muny': '100\$'},
    {'name': 'ngũ vị', 'image': 'assets/cart/spices.png', 'muny': '100\$'},
    {'name': 'rau', 'image': 'assets/cart/Spinach.png', 'muny': '100\$'},
    {'name': 'củ quả', 'image': 'assets/cart/veg.png', 'muny': '100\$'},
  ];
  @override
  void initState() {
    super.initState();
    _blocProducts = BlocProducts();
    updateDisplayedProducts('');
  }

  @override
  void dispose() {
    _searchTextController!.dispose();
    _searchTextFocusnode.dispose();
    _blocProducts.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);

    Size size = utils.getscreenSize;
    return BlocProvider(
      create: (context) => _blocProducts,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 142, 240, 165),
          title: TextWidget(
              text: 'All Products',
              color: Colors.black,
              texSize: FontStyle.italic),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Container(
                height: 60,
                child: TextField(
                  focusNode: _searchTextFocusnode,
                  controller: _searchTextController,
                  onChanged: (value) {
                    updateDisplayedProducts(value);
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Colors.greenAccent, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.greenAccent, width: 2)),
                      hintText: 'What in your mind',
                      prefixIcon: const Icon(Icons.search),
                      suffix: IconButton(
                        onPressed: () {
                          _searchTextController!.clear();
                          _searchTextFocusnode.unfocus();
                          updateDisplayedProducts('');
                        },
                        icon: Icon(
                          Icons.close,
                          color: _searchTextFocusnode.hasFocus
                              ? Colors.red
                              : Colors.black,
                        ),
                      )),
                ),
              ),
              Flexible(
                  child: BlocBuilder<BlocProducts, List<Map<String, dynamic>>>(
                builder: (context, displayedProducts) {
                  return GridView.count(
                    shrinkWrap: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisCount: 2,
                    childAspectRatio: size.width / (size.height * 0.53),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: displayedProducts.map((product) {
                      return ProductWidget(
                        name: product['name'],
                        image: product['image'],
                        muny: product['muny'],
                      );
                    }).toList(),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  void updateDisplayedProducts(String searchText) {
    if (searchText.isEmpty) {
      _blocProducts.updataDisplayedProducts(user);
    } else {
      List<Map<String, dynamic>> filteredProducts = user.where((product) {
        return product['name'].toLowerCase().contains(searchText.toLowerCase());
      }).toList();
      _blocProducts.updataDisplayedProducts(filteredProducts);
    }
  }
}
