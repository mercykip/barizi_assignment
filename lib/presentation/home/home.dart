import 'package:barizi_assignment/presentation/products/favorite_product.dart';
import 'package:barizi_assignment/presentation/products/products_page.dart';
import 'package:barizi_assignment/utils/constants.dart';
import 'package:barizi_assignment/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const ProductsPage(),
    const FavouriteProducts(),
    const ProductsPage(),
    const FavouriteProducts(),
    const ProductsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/shop.png",
              color: _selectedIndex == 0 ? secColor : Colors.black,
            ),
            label: shop,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/search.png",
              color: _selectedIndex == 1 ? secColor : Colors.black,
            ),
            label: explore,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: cart,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: favorites,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: account,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: secColor,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.normal, color: secColor),
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
