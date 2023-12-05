// import 'package:bridge_events/screen/profile.dart';
// import 'package:bridge_events/screen/settings_page.dart';
// import 'package:dot_navigation_bar/dot_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
//
// class DrawerScreen extends StatefulWidget {
//   const DrawerScreen({super.key});
//
//   @override
//   State<DrawerScreen> createState() => _DrawerScreenState();
// }
//
// class _DrawerScreenState extends State<DrawerScreen> {
//   final zoomDrawerController = ZoomDrawerController();
//
//   @override
//   Widget build(BuildContext context) {
//     return ZoomDrawer(
//       slideWidth: MediaQuery.of(context).size.width * 0.5,
//       showShadow: true,
//       shadowLayer1Color: Colors.white,
//       mainScreenTapClose: true,
//       menuScreenWidth: double.infinity,
//       menuBackgroundColor: Colors.black,
//       controller: zoomDrawerController,
//       menuScreen: const MenuScreen(),
//       mainScreen: const MainScreen(),
//       style: DrawerStyle.style4,
//       borderRadius: 50,
//       angle: -18,
//       openCurve: Curves.fastOutSlowIn,
//       closeCurve: Curves.bounceInOut,
//     );
//   }
// }
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   var _selectedTab = SelectedTab.home;
//
//   void _handleIndexChanged(int index) {
//     setState(() {
//       _selectedTab = SelectedTab.values[index];
//     });
//   }
//   var photo = ['assets/images/profile1.jpg',
//     'assets/images/profile1.jpg',
//     'assets/images/profile1.jpg'];
//
//   var name=["avhhah","shhsb","jshxjsh"];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: Stack(children: [
//         ListView.builder(
//           itemCount: photo.length,
//
//           itemBuilder: (context, index) {
//             return Container(
//               margin: const EdgeInsets.all(15),
//               child: Center(child: SizedBox(child:
//
//
//               InkWell(onTap: () {
//
//               },
//                   child: Card(
//
//                       child: Column(
//                         children: [
//                           Image(image: AssetImage(photo[index])),
//                           Text(name[index])
//                         ],
//                       ))))),
//             );
//           },
//         ),
//         Positioned(
//           top: 40,
//           left: 7,
//           child: IconButton(
//             icon: Icon(Icons.grid_view_outlined, size: 30),
//             onPressed: () {
//               if (ZoomDrawer.of(context)!.isOpen()) {
//                 ZoomDrawer.of(context)!.close();
//               } else {
//                 ZoomDrawer.of(context)!.open();
//               }
//               // Handle menu button tap
//             },
//           ),
//         ),
//       ]),
//       bottomNavigationBar: DotNavigationBar(
//         currentIndex: SelectedTab.values.indexOf(_selectedTab),
//         backgroundColor: Colors.white,
//         splashColor: Colors.white10,
//         selectedItemColor: Colors.black,
//         dotIndicatorColor: Colors.pink,
//         unselectedItemColor: Colors.grey,
//         onTap: _handleIndexChanged,
//         items: [
//           DotNavigationBarItem(
//             icon: const Icon(Icons.home),
//           ),
//           DotNavigationBarItem(icon: const Icon(Icons.calendar_month_outlined)),
//           DotNavigationBarItem(icon: const Icon(Icons.currency_rupee_rounded)),
//           DotNavigationBarItem(
//             icon: InkWell(
//               child: const Icon(
//                 Icons.person,
//               ),
//               onTap: () {
//                 setState(() {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) {
//                       return const Profile();
//                     },
//                   ));
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// enum SelectedTab {
//   home,
//   calendar_month_outlined,
//   currency_rupee_rounded,
//   person
// }
//
// class MenuScreen extends StatefulWidget {
//   const MenuScreen({super.key});
//
//   @override
//   State<MenuScreen> createState() => _MenuScreenState();
// }
//
// class _MenuScreenState extends State<MenuScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           const Positioned(
//             top: 100,
//             left: 70,
//             child: Stack(children: [
//               CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.white54,
//                 child: CircleAvatar(
//                   radius: 55,
//                   backgroundImage: AssetImage(
//                     'assets/images/profile1.jpg',
//                   ),
//                 ),
//               ),
//             ]),
//           ),
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 350, left: 50),
//                 child: SizedBox(
//                   width: 270,
//                   height: 60,
//                   child: ListTile(
//                     onTap: () {
//                       setState(() {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return const DrawerScreen();
//                           },
//                         ));
//                       });
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     trailing: const Padding(
//                       padding: EdgeInsets.only(right: 85),
//                       child: Icon(Icons.home_outlined,
//                           size: 20, color: Colors.white),
//                     ),
//                     title: const Text("Home",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700)),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, left: 50),
//                 child: SizedBox(
//                   width: 270,
//                   height: 60,
//                   child: ListTile(
//                     onTap: () {
//                       setState(() {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return Profile();
//                           },
//                         ));
//                       });
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     trailing: const Padding(
//                       padding: EdgeInsets.only(right: 85),
//                       child: Icon(Icons.account_circle_outlined,
//                           size: 18, color: Colors.white),
//                     ),
//                     title: const Text(
//                       "Profile",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, left: 50),
//                 child: SizedBox(
//                   width: 270,
//                   height: 60,
//                   child: ListTile(
//                     onTap: () {
//                       setState(() {
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return const SettingPage();
//                           },
//                         ));
//                       });
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     trailing: const Padding(
//                       padding: EdgeInsets.only(right: 85),
//                       child:
//                       Icon(Icons.settings, size: 20, color: Colors.white),
//                     ),
//                     title: const Text("Settings",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700)),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, left: 50),
//                 child: SizedBox(
//                   width: 270,
//                   height: 60,
//                   child: ListTile(
//                     onTap: () {},
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     trailing: const Padding(
//                       padding: EdgeInsets.only(right: 85),
//                       child: Icon(Icons.rate_review_outlined,
//                           size: 20, color: Colors.white),
//                     ),
//                     title: const Text("Rating",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700)),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8, left: 50),
//                 child: SizedBox(
//                   width: 270,
//                   height: 60,
//                   child: ListTile(
//                     onTap: () {},
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     trailing: const Padding(
//                       padding: EdgeInsets.only(right: 85),
//                       child: Icon(Icons.logout, size: 20, color: Colors.white),
//                     ),
//                     title: const Text("Logout",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w700)),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ]),
//       ),
//     );
//   }
// }
