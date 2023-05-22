import 'package:flutter/material.dart';

class Products {
  final String title;
  final String imageUrl;
  final Color? bgColor;
  final Color borderColor;

  Products(
      {required this.title,
      required this.imageUrl,
      required this.bgColor,
      required this.borderColor});
}

class Favourite {
  final String title;
  final String imageUrl;
  final String priceTitle;
  final String priceAmount;
  final String quantity;

  Favourite(
      {required this.title,
      required this.imageUrl,
      required this.priceTitle,
      required this.priceAmount,
      required this.quantity});
}
