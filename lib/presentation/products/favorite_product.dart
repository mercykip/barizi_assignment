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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Favorite",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            const Divider(),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                itemCount: favourites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(favourites[index].imageUrl),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          favourites[index].title,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          favourites[index].quantity,
                          style: const TextStyle(color: quantityFavouriteColor),
                        ),
                      ],
                    ),
                    subtitle: Text(favourites[index].priceTitle),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.attach_money,
                              size: 17,
                            ),
                            Text(favourites[index].priceAmount),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 300, // <-- Your width
              height: 50, // <-- Your height
              child: TextButton(
                  style: ButtonStyle(
                      // padding: MaterialStateProperty.all<EdgeInsets>(
                      //     const EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(secColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ))),
                  onPressed: () {},
                  child: Text("Add All To Cart".toUpperCase(),
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}
