import 'dart:ui';

import 'package:bridge_events/controller/get_user_data_controller/getUserData.dart';
import 'package:bridge_events/screen/login_page/login.dart';
import 'package:bridge_events/screen/splash_screen_page/splashScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../controller/google_controller/google_controller_file.dart';
import '../../profile_page/profile.dart';
import '../../setting_page/setting.dart';

import '../drawer_page/drawer.dart';
import '../navigation_page/navigation.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  GetUserDataController _getUserDataController = GetUserDataController();

  Future<List<QueryDocumentSnapshot<Object?>>> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    return _getUserDataController.getUserData(user!.uid);
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
            return WillPopScope(child: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    left: 70,
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white54,
                        child: CircleAvatar(
                            radius: 55,
                            backgroundImage:
                                NetworkImage("${data[0]['userImg']}")),
                      ),
                    ]),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 350, left: 0),
                        child: SizedBox(
                          width: 270,
                          height: 60,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const DrawerScreen();
                                  },
                                ));
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            trailing: const Padding(
                              padding: EdgeInsets.only(right: 85),
                              child: Icon(Icons.home_outlined,
                                  size: 20, color: Colors.white),
                            ),
                            title: const Text("Home",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 0),
                        child: SizedBox(
                          width: 270,
                          height: 60,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const Profile();
                                  },
                                ));
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            trailing: const Padding(
                              padding: EdgeInsets.only(right: 85),
                              child: Icon(Icons.account_circle_outlined,
                                  size: 18, color: Colors.white),
                            ),
                            title: const Text(
                              "Profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 0),
                        child: SizedBox(
                          width: 270,
                          height: 60,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const SettingPage();
                                  },
                                ));
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            trailing: const Padding(
                              padding: EdgeInsets.only(right: 85),
                              child: Icon(Icons.settings,
                                  size: 20, color: Colors.white),
                            ),
                            title: const Text("Settings",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 0),
                        child: SizedBox(
                          width: 270,
                          height: 60,
                          child: ListTile(
                            onTap: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            trailing: const Padding(
                              padding: EdgeInsets.only(right: 85),
                              child: Icon(Icons.rate_review_outlined,
                                  size: 20, color: Colors.white),
                            ),
                            title: const Text("Rating",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8, left: 0),
                          child: SizedBox(
                              width: 270,
                              height: 60,
                              child: ListTile(
                                onTap: () {
                                  setState(()async {
                                    GoogleSignIn googleSignIn = GoogleSignIn();
                                    FirebaseAuth _auth = FirebaseAuth.instance;
                                    await _auth.signOut();
                                    await googleSignIn.signOut();
                                    Get.offAll(() => Login());                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                trailing: const Padding(
                                  padding: EdgeInsets.only(right: 85),
                                  child: Icon(Icons.logout,
                                      size: 20, color: Colors.white),
                                ),
                                title: const Text("Logout",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              )))
                    ],
                  ),
                ],
              ),

            ),
                onWillPop: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NavigationScreen()),
              );                return false;
            },
            );
          }
        },
      ),
    );
  }
}
