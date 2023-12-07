
import 'package:bridge_events/screen/calenderPriceRange/booking.dart';
import 'package:bridge_events/screen/hindu_wedding/hindu_page1.dart';
import 'package:bridge_events/screen/home_page.dart';
import 'package:bridge_events/screen/login_page.dart';
import 'package:bridge_events/screen/profile.dart';
import 'package:bridge_events/screen/splash_screen.dart';
import 'package:bridge_events/screen/trash/profileDemo.dart';

import 'package:bridge_events/screen/trash1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      // theme: ThemeData(visualDensity: VisualDensity.compact),
      home: DrawerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
