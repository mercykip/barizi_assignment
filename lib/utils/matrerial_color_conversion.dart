import 'package:flutter/material.dart';
Color convertColor(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

MaterialStateProperty<Color> getButtonColor(String hexColor) {
  final color = convertColor(hexColor);
  return MaterialStateProperty.all<Color>(color);
}
