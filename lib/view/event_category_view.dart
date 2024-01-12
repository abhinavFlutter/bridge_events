import 'dart:ui';

import 'package:bridge_events/controller/event_category_controller.dart';
import 'package:bridge_events/view/description_view.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import the package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import '../screen/homePage/carousel_page/carousel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final EventCategoryController _eventCategoryController =
  Get.put(EventCategoryController());

  final itemHeight = 250.0;
  final itemWidth = 180.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                        onPressed: () {
                          if (ZoomDrawer.of(context)!.isOpen()) {
                            ZoomDrawer.of(context)!.close();
                          } else {
                            ZoomDrawer.of(context)!.open();
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.circle_grid_3x3,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          'Bridge Events',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 34,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: CarouselPage(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Find Your",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Text(
                "Wedding Party",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
                  future: _eventCategoryController.getEventCategoryData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final categoryName = snapshot.data!
                          .map((doc) => doc['categoryName'].toString())
                          .toList();
                      final categoryImg = snapshot.data!
                          .map((doc) => doc['categoryImg'].toString())
                          .toList();

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categoryName.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                        ),
                        itemBuilder: (context, index) {
                          final imagePath = categoryImg[index];
                          final title = categoryName[index];
                          return InkWell(
                            onTap: () {
                              Get.to(() => const DescriptionPage());
                            },
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Stack(
                                children: [
                                  // CachedNetworkImage
                                  CachedNetworkImage(
                                    imageUrl: imagePath,
                                    imageBuilder: (context, imageProvider) =>
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20.0),
                                          child: Image(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                        Container(color: Colors.grey[200]),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),

                                  // Text
                                  Positioned(
                                    right: 38.0,
                                    left: 38.0,
                                    bottom: 25.0,
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(20.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 8.0,
                                              sigmaY: 8.0,
                                            ),
                                            child: SizedBox(
                                              height: 68.0,
                                              width: 145.0,
                                              child: Center(
                                                child: Text(
                                                  title,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20.0,
                                                    color: Colors.white,
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
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return CircularProgressIndicator(
                        color: Colors.black,
                        backgroundColor: Colors.green,
                      );
                    }
                  },
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "Follow Me...!",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
