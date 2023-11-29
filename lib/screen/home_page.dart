import 'package:bridge_events/screen/profile.dart';
import 'package:bridge_events/screen/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black)),
      drawer: Drawer(
        elevation: 20,
        backgroundColor: Colors.grey,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black26,
                child: const Column(
                ),
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(150)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 150, left: 90),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 154, left: 94),
              child: CircleAvatar(
                radius: 56,
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('assets/images/chikks.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 320, left: 25, right: 25),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: const Padding(
                  padding: EdgeInsets.only(left: 89),
                  child: Text("Home",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
                tileColor: Colors.black,
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Home();
                      },
                    ));
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, right: 25, left: 25),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: const Padding(
                  padding: EdgeInsets.only(left: 89),
                  child: Text("Settings",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
                tileColor: Colors.black,
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SettingPage();
                      },
                    ));
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 480, left: 25, right: 25),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: const Padding(
                  padding: EdgeInsets.only(left: 89),
                  child: Text("Profile",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
                tileColor: Colors.black,
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Profile();
                      },
                    ));
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 560, left: 25, right: 25),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: const Padding(
                  padding: EdgeInsets.only(left: 89),
                  child: Text("LogOut",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
                tileColor: Colors.black,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),

    );
  }
}
