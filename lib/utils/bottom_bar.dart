import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

List<PersistentBottomNavBarItem> _navBarItems = [
  PersistentBottomNavBarItem(
    icon: Icon(Icons.shop),
    title: 'Shop',
    activeColorPrimary: Colors.blue,
    inactiveColorPrimary: Colors.grey,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(Icons.send_and_archive_sharp),
    title: 'Explore',
    activeColorPrimary: Colors.blue,
    inactiveColorPrimary: Colors.grey,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(Icons.add_shopping_cart_rounded),
    title: 'Cart',
    activeColorPrimary: Colors.blue,
    inactiveColorPrimary: Colors.grey,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(Icons.favorite),
    title: 'Favorites',
    activeColorPrimary: Colors.blue,
    inactiveColorPrimary: Colors.grey,
  ),
  PersistentBottomNavBarItem(
    icon: Icon(Icons.person),
    title: 'Account',
    activeColorPrimary: Colors.blue,
    inactiveColorPrimary: Colors.grey,
  ),
];