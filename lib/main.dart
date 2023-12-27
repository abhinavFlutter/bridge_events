
import 'package:bridge_events/screen/login_page/login.dart';
import 'package:bridge_events/screen/registration_page/registration.dart';
import 'package:bridge_events/screen/splash_screen_page/splashScreen.dart';
import 'package:bridge_events/view/description_view.dart';
import 'package:bridge_events/view/event_category_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

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
    return const GetMaterialApp(
      // theme: ThemeData(visualDensity: VisualDensity.compact),
      home: Splashscreen1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
