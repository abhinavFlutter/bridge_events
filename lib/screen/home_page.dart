import 'package:bridge_events/screen/profile.dart';
import 'package:bridge_events/screen/settings_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'hindu_wedding/hindu_page1.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      slideWidth: MediaQuery.of(context).size.width * 0.5,
      showShadow: true,
      shadowLayer1Color: Colors.white,
      mainScreenTapClose: true,
      menuScreenWidth: double.infinity,
      menuBackgroundColor: Colors.black,
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(),
      mainScreen: const MainScreen(),
      style: DrawerStyle.style4,
      borderRadius: 50,
      angle: -18,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceInOut,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedTab = SelectedTab.home;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = SelectedTab.values[index];
    });
  }

  int currentindex = 0;

  final List<String> imageList = [
    'assets/images/scroll1.jpg',
    'assets/images/scroll2.jpg',
    'assets/images/scroll3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      extendBody: true,
      body: ListView(children: [
        Stack(children: [
          Positioned(
            top: 10,
            left: 7,
            child: IconButton(
              icon: const Icon(Icons.grid_view_outlined,
                  size: 25, color: Colors.black),
              onPressed: () {
                if (ZoomDrawer.of(context)!.isOpen()) {
                  ZoomDrawer.of(context)!.close();
                } else {
                  ZoomDrawer.of(context)!.open();
                }
                // Handle menu button tap
              },
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 100),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Text('Bridge Events',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 34,
                                color: Colors.black)),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 220,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
                    padEnds: true,
                    aspectRatio: 3.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentindex = index;
                      });
                    },
                  ),
                  items: imageList.map((items) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          items,
                          fit: BoxFit.fill,
                          width: 1200.0,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("Find Your",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
              ),
              const Text("Wdding Party",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700)),
              Padding(
                  padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HinduPage1();
                                },
                              ));
                            });
                          },
                          child: SizedBox(
                            width: 183,
                            height: 300,
                            child: Stack(
                              children: [
                                // Image
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/images/traditional.jpg'),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),

                                // Text
                                const Positioned(
                                  right: 38,
                                  left: 38,
                                  bottom: 25,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Traditional",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Wedding",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HinduPage1();
                                },
                              ));
                            });
                          },
                          child: SizedBox(
                            width: 183,
                            height: 300,
                            child: Stack(
                              children: [
                                // Image
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/vintage2.jpeg'),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),

                                // Text
                                const Positioned(
                                  right: 38,
                                  left: 38,
                                  bottom: 25,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Vintage",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Style",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HinduPage1();
                                },
                              ));
                            });
                          },
                          child: SizedBox(
                            width: 183,
                            height: 300,
                            child: Stack(
                              children: [
                                // Image
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/beach2.jpeg'),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),

                                // Text
                                Positioned(
                                  right: 38,
                                  left: 38,
                                  bottom: 25,
                                  child: Column(
                                    children: [
                                      Text(
                                        "On the ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "beach",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HinduPage1();
                                },
                              ));
                            });
                          },
                          child: SizedBox(
                            width: 183,
                            height: 300,
                            child: Stack(
                              children: [
                                // Image
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/images/rustic.jpeg'),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),

                                // Text
                                const Positioned(
                                  right: 38,
                                  left: 38,
                                  bottom: 25,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Rustic",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Wedding",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HinduPage1();
                                },
                              ));
                            });
                          },
                          child: SizedBox(
                            width: 183,
                            height: 300,
                            child: Stack(
                              children: [
                                // Image
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Image(
                                      image:
                                          AssetImage('assets/images/diy.jpeg'),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),

                                // Text
                                const Positioned(
                                  right: 38,
                                  left: 38,
                                  bottom: 25,
                                  child: Column(
                                    children: [
                                      Text(
                                        "DIY ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "wedding",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HinduPage1();
                                },
                              ));
                            });
                          },
                          child: SizedBox(
                            width: 183,
                            height: 300,
                            child: Stack(
                              children: [
                                // Image
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/images/bohemian.jpeg'),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),

                                // Text
                                const Positioned(
                                  right: 38,
                                  left: 38,
                                  bottom: 25,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Bohemian ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "romance",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HinduPage1();
                                },
                              ));
                            });
                          },
                          child: SizedBox(
                            width: 183,
                            height: 300,
                            child: Stack(
                              children: [
                                // Image
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/images/inspired.jpeg'),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),

                                // Text
                                const Positioned(
                                  right: 38,
                                  left: 38,
                                  bottom: 25,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Industrial ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "inspired",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return HinduPage1();
                                },
                              ));
                            });
                          },
                          child: SizedBox(
                            width: 183,
                            height: 300,
                            child: Stack(
                              children: [
                                // Image
                                Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/images/outdor.jpeg'),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),

                                // Text
                                const Positioned(
                                  right: 38,
                                  left: 38,
                                  bottom: 25,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Garden or  ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        " outdoors",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Center(child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text("Follow Me...!",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),),
              )),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        child: Image(
                          image: AssetImage('assets/images/instaQR1.jpg'),
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
              ),





            ],
          ),
        ]),
      ]),
      bottomNavigationBar: DotNavigationBar(
        currentIndex: SelectedTab.values.indexOf(_selectedTab),
        backgroundColor: Colors.white70,
        splashColor: Colors.white10,
        selectedItemColor: Colors.black,
        dotIndicatorColor: Colors.pink,
        unselectedItemColor: Colors.black,
        onTap: _handleIndexChanged,
        items: [
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
          ),
          DotNavigationBarItem(icon: const Icon(Icons.calendar_month_outlined)),
          DotNavigationBarItem(icon: const Icon(Icons.currency_rupee_rounded)),
          DotNavigationBarItem(
            icon: InkWell(
              child: const Icon(
                Icons.person,
              ),
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
        ],
      ),
    );
  }
}

enum SelectedTab {
  home,
  calendar_month_outlined,
  currency_rupee_rounded,
  person
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
                    onTap: () {},
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
