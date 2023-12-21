
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../controller/email_password_controller/emailPassword.dart';
import '../../profile_page/profile.dart';
import '../../setting_page/setting.dart';

import '../drawer_page/drawer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  GoogleSignInController googleSignInController=GoogleSignInController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(children: [
          const Positioned(
            top: 100,
            left: 70,
            child: Stack(children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white54,
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(
                    'assets/images/profile1.jpg',
                  ),
                ),
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
                      child:
                      Icon(Icons.settings, size: 20, color: Colors.white),
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

                      setState(() {
                        googleSignInController.signOutGoogle();
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    trailing: const Padding(
                      padding: EdgeInsets.only(right: 85),
                      child: Icon(Icons.logout, size: 20, color: Colors.white),
                    ),
                    title: const Text("Logout",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
