import 'package:barizi_assignment/presentation/auth/signin.dart';
import 'package:barizi_assignment/presentation/products/favorite_product.dart';
import 'package:barizi_assignment/presentation/products/products_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barizi Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const ProductsPage(),
        '/signin': (context) => const SignIn(),
        '/products': (context) => const ProductsPage(),
        '/favourite_product': (context) => const FavouriteProducts(),
      },
    );
  }
}
