
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'mainScreen.dart';
import 'menuScreen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final zoomDrawerController = ZoomDrawerController();


  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      slideWidth: MediaQuery.of(context).size.width * 0.5,
      showShadow: true,
      shadowLayer1Color: Colors.white,
      mainScreenTapClose: true,
      menuScreenWidth: double.infinity,
      menuBackgroundColor: Colors.black,
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(),
      mainScreen: const MainScreen(),
      style: DrawerStyle.style4,
      borderRadius: 50,
      angle: -18,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceInOut,
    );
  }
}
