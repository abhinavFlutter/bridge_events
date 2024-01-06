import 'dart:ui';

import 'package:bridge_events/screen/homePage/navigation_page/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../controller/get_user_data_controller/getUserData.dart';
import '../../controller/google_controller/google_controller_file.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GoogleSignInController googleSignInController = GoogleSignInController();
  final GetUserDataController _getUserDataController = GetUserDataController();

  Future<List<QueryDocumentSnapshot<Object?>>> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    return _getUserDataController.getUserData(user!.uid);
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  final loginKey = GlobalKey<FormState>();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<QueryDocumentSnapshot<Object?>> data = snapshot.data!;
            return WillPopScope(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width,
                        height: 650,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${data[0]['userImg']}"),
                            colorFilter: const ColorFilter.mode(
                                Colors.black45, BlendMode.colorBurn),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 470),
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      width: 300,
                                      height: 280,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35),
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                      child: Column(
                                        verticalDirection:
                                            VerticalDirection.down,
                                        children: [
                                          Container(
                                              width: 200,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white),
                                              child: Center(
                                                  child: Text(
                                                      "${data.isNotEmpty ? data[0]['username'] : 'N/A'}"))),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Container(
                                                width: 200,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white),
                                                child: Center(
                                                    child: Text(
                                                        "${!data.isNotEmpty ? data[0]['phone'] : 'xxx xxx xxxx'}"))),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Container(
                                                width: 200,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.white),
                                                child: Text(
                                                    "${data.isNotEmpty ? data[0]['email'] : 'N/A'}")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onWillPop: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NavigationScreen()),
                );
                return false;
              },
            );
          }
        },
      ),
    );
  }
}
