

import 'package:bridge_events/screen/hindu_wedding/hindu_page1.dart';
import 'package:bridge_events/screen/homePage/drawerScreen.dart';
import 'package:bridge_events/screen/homePage/mainScreen.dart';
import 'package:bridge_events/screen/homePage/navigation.dart';
import 'package:bridge_events/screen/trash/demo/h2.dart';
import 'package:bridge_events/screen/trash/demo/home_demo.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return     const MaterialApp(
      // theme: ThemeData(visualDensity: VisualDensity.compact),
      home:HinduPage1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
