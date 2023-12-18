import 'package:bridge_events/screen/bookingPage/booking.dart';
import 'package:bridge_events/screen/hindu_wedding/hindu_demo.dart';
import 'package:bridge_events/screen/hindu_wedding/hindu_page1.dart';
import 'package:bridge_events/screen/homePage/drawerScreen.dart';
import 'package:bridge_events/screen/homePage/mainScreen.dart';
import 'package:bridge_events/screen/homePage/navigation.dart';
import 'package:bridge_events/screen/login_page.dart';
import 'package:bridge_events/screen/splash_screen.dart';
import 'package:bridge_events/view/eventcategoryitem.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData(visualDensity: VisualDensity.compact),
      home: EventCategoryItem(),
      debugShowCheckedModeBanner: false,
    );
  }
}
