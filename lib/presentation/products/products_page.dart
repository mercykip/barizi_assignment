import 'package:barizi_assignment/models/products.dart';
import 'package:barizi_assignment/utils/custom_colors.dart';
import 'package:barizi_assignment/utils/products_list.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Products> filteredItems = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredItems = items
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredItems = List.from(items);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 3) {
        Navigator.pushNamed(
          context,
          '/favourite_product',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Find Products",
              style: TextStyle(
                  color: productTitleColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextFormField(
                  onChanged: (value) => _filterItems(value),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: searchIconColor,
                    ),
                    labelText: 'Search Store',
                    labelStyle: TextStyle(
                      color:
                          searchTextColor, // Set the desired label text color
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle item tap
                      // print('Item tapped: ${filteredItems[index].title}');
                    },
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                filteredItems[index].imageUrl,
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Text(
                              filteredItems[index].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/shop.png",
              color: _selectedIndex == 0 ? secColor : Colors.black,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/search.png",
              color: _selectedIndex == 1 ? secColor : Colors.black,
            ),
            label: 'Explore',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Account',
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
    ));
  }
}
