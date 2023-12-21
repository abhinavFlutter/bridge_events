import 'dart:async';

import 'package:flutter/material.dart';

import '../open_page/open.dart';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({super.key});

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(
        seconds: 3,
      ),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OpenPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 140),
                  child: Image(
                      image: AssetImage(
                        'assets/images/logo2.png',
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 110),
                  child: CircularProgressIndicator(color: Color.fromARGB(255, 255, 182, 193)),
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

                              color: Colors.white, letterSpacing: 2, wordSpacing: 2,

                            ),
                          ),
                          Text(
                            maxLines: 3,
                            "it brings out the best version of you.",
                            style: TextStyle(

                              color: Colors.white, letterSpacing: 2, wordSpacing: 2,

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
      backgroundColor: Colors.black,
    );
  }
}
