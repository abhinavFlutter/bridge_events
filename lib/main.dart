import 'package:bridge_events/screen/calenderPriceRange/calender_price.dart';
import 'package:bridge_events/screen/forgot_password.dart';
import 'package:bridge_events/screen/hindu_wedding/hindu_page1.dart';
import 'package:bridge_events/screen/home_page.dart';

import 'package:bridge_events/screen/login_page.dart';
import 'package:bridge_events/screen/opening_page.dart';
import 'package:bridge_events/screen/profile.dart';
import 'package:bridge_events/screen/registration_page.dart';
import 'package:bridge_events/screen/responsive_screen/responsive_screen.dart';
import 'package:bridge_events/screen/settings_page.dart';
import 'package:bridge_events/screen/splash_screen.dart';

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
