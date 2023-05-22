import 'package:barizi_assignment/models/products.dart';
import 'package:barizi_assignment/utils/constants.dart';
import 'package:barizi_assignment/utils/custom_colors.dart';
import 'package:barizi_assignment/utils/favourite_list.dart';
import 'package:flutter/material.dart';

class FavouriteProducts extends StatefulWidget {
  const FavouriteProducts({super.key});

  @override
  State<FavouriteProducts> createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                favorite,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: favourites.length,
                  itemBuilder: (context, index) {
                    return FavouriteItem(favourite: favourites[index]);
                  },
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                  ),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300, // <-- Your width
                  height: 50, // <-- Your height
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(secColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                      onPressed: () {},
                      child: Text(addToCart.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({required this.favourite, super.key});

  final Favourite favourite;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(favourite.imageUrl),
      title: Column(
        children: [
          Text(
            favourite.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
          ),
          Text(
            favourite.quantity,
            style: const TextStyle(color: quantityFavouriteColor),
          ),
        ],
      ),
      subtitle: Text(favourite.priceTitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(
                Icons.attach_money,
                size: 17,
              ),
              Text(favourite.priceAmount),
            ],
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
