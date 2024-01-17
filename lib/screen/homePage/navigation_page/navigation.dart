import 'package:bridge_events/screen/setting_page/setting.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../view/fav_page.dart';
import '../../profile_page/profile.dart';
import '../drawer_page/drawer.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late User? user; // Initialize user variable
  int _currentSelectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Fetch user information or set it in your authentication flow
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      const DrawerScreen(),
      FavouriteScreen(),
      SettingPage(),
      const Profile(),
    ];

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
          DotNavigationBarItem(icon: const Icon(Icons.settings)),
          DotNavigationBarItem(icon: Icon(Icons.person)),
        ],
        onTap: (index) {
          setState(() {
            _currentSelectedIndex = index;
          });
        },
      ),
    );
  }
}
