
import 'package:bridge_events/model/description_model.dart';
import 'package:bridge_events/model/event_carousel_slider_model.dart';
import 'package:bridge_events/screen/Text_button/textButton.dart';
import 'package:bridge_events/screen/booking_page/booking.dart';
import 'package:bridge_events/screen/homePage/carousel_page/carousel.dart';
import 'package:bridge_events/screen/homePage/navigation_page/navigation.dart';
import 'package:bridge_events/screen/login_page/login.dart';
import 'package:bridge_events/screen/payment/payment.dart';
import 'package:bridge_events/screen/profile_page/profile.dart';
import 'package:bridge_events/screen/splash_screen_page/splashScreen.dart';
import 'package:bridge_events/view/description_view.dart';
import 'package:bridge_events/view/event_category_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controller/cartController.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  Get.put(FavoritrController2()); // or Get.lazyPut(() => CartController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   const GetMaterialApp(
      // theme: ThemeData(visualDensity: VisualDensity.compact),
      home: NavigationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
