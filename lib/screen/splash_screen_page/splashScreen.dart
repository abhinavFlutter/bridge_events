import 'dart:async';

import 'package:bridge_events/screen/homePage/navigation_page/navigation.dart';
import 'package:bridge_events/screen/login_page/login.dart';
import 'package:bridge_events/screen/trash/trash1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../open_page/open.dart';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({super.key});

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  @override
  // void initState() {
  //   super.initState();
  //
  //   Timer(
  //     const Duration(
  //       seconds: 3,
  //     ),
  //         () => Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const OpenPage(),
  //       ),
  //     ),
  //   );
  // }


  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () {
      logInCheck(context);
    });
  }

  Future<void> logInCheck(BuildContext context) async {
    if (user != null) {
      Get.offAll(() => const NavigationScreen(),
          transition: Transition.leftToRightWithFade);
    } else {
      Get.to(() => Login(),
          transition: Transition.leftToRightWithFade);
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.asset('assets/json/splash.json',
            // repeat: true,animate: true
            // ),
            Padding(
              padding: EdgeInsets.only(top: 140),
              child: Image(
                  image: AssetImage(
                    'assets/images/splashscreen2.png',
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child:    SizedBox(height: 150,width: 150,
                child: Lottie.asset('assets/json/splash.json',
                    repeat: true,animate: true
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 90,left: 10,right: 10),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: Column(
                    children: [
                      Text(
                        maxLines: 3,
                        "If you are with the right person,",
                        style: TextStyle(

                          color: Colors.black, letterSpacing: 2, wordSpacing: 2,

                        ),
                      ),
                      Text(
                        maxLines: 3,
                        "it brings out the best version of you.",
                        style: TextStyle(

                          color: Colors.black, letterSpacing: 2, wordSpacing: 2,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
