import 'package:barizi_assignment/models/products.dart';
import 'package:barizi_assignment/utils/constants.dart';
import 'package:barizi_assignment/utils/custom_colors.dart';
import 'package:barizi_assignment/utils/products_list.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Products> filteredItems = [];


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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              findProducts,
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
                    labelText: searchStore,
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
                      color: filteredItems[index].bgColor,
                      shape: RoundedRectangleBorder(
                        //<-- SEE HERE
                        side: BorderSide(
                          color: filteredItems[index].borderColor,
                        ),
                      ),
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
    ));
  }
}
