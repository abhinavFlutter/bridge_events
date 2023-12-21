
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../profile_page/profile.dart';
import '../cart_page/cart.dart';
import '../drawer_page/drawer.dart';
import '../favourite_page/favourite.dart';


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentSelectedIndex = 0;
  final List<Widget> _pages = [
    const DrawerScreen(),
    const Favourite(),
    const Cart(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        extendBody: true,
        body: _pages[_currentSelectedIndex],
        bottomNavigationBar: DotNavigationBar(
            backgroundColor: Colors.black54,
            splashColor: Colors.white10,
            selectedItemColor: Colors.white,
            dotIndicatorColor: Colors.yellow,
            unselectedItemColor: Colors.white,
            items: [
              DotNavigationBarItem(
                icon: const Icon(Icons.home),
              ),
              DotNavigationBarItem(icon: const Icon(Icons.favorite)),
              DotNavigationBarItem(
                  icon: const Icon(Icons.shopping_cart_outlined)),
              DotNavigationBarItem(icon: Icon(Icons.person))
            ],
            onTap: (index) {
              setState(() {
                _currentSelectedIndex = index;
              });
            }));
  }
}
