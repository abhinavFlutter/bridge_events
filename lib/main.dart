import 'package:bridge_events/screen/login_Page1.dart';
import 'package:bridge_events/screen/login_page.dart';
import 'package:bridge_events/screen/profile.dart';
import 'package:bridge_events/screen/registration_page.dart';
import 'package:bridge_events/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // theme: ThemeData(visualDensity: VisualDensity.compact),
      home: const Splashscreen1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
