import 'dart:ui';
import 'package:bridge_events/view/description_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../screen/homePage/carousel_page/carousel.dart';
import 'des_controller.dart';
import 'des_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AlleventsController _alleventsController = AlleventsController();

  final itemHeight = 250.0;
  final itemWidth = 180.0;

  late User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

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
                child: StreamBuilder<QuerySnapshot>(
                  stream: _alleventsController.getAlleventsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        width: 500,
                        height: 500,
                        child:Lottie.
                        asset('assets/json/loading.json',
                            repeat: true, reverse: false, animate: true,),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return Text('No categories found');
                    } else {
                      QuerySnapshot querySnapshot = snapshot.data!;
                      List<QueryDocumentSnapshot> documents =
                          querySnapshot.docs;

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: documents.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                        ),
                        itemBuilder: (context, index) {
                          QueryDocumentSnapshot document = documents[index];
                          Map<String, dynamic> documentData =
                              document.data() as Map<String, dynamic>;

                          String documentId = document.id;
                          String cName = documentData['cname'] ?? '';
                          String cImage = documentData['cimage'] ?? '';
                          return InkWell(
                            onTap: () async {
                              final documentId = document.id;
                              final List<dynamic>? referenceList =
                                  documentData['products'];

                              if (referenceList != null) {
                                final List<DocumentReference> references =
                                    referenceList.cast<
                                        DocumentReference>(); // Cast to DocumentReference

                                // Fetch data from the referenced allevents documents
                                final allEventsData = await Future.wait(
                                    references.map((ref) => ref.get()));

                                Get.to(
                                  () => DescriptionPage(
                                    documentId: documentId,
                                    categoryName: cName,
                                    categoryImage: cImage,
                                    allEventsData: allEventsData,
                                    user: user,
                                  ),
                                );
                              }
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
                                    imageUrl: cImage,
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
                                                  cName.toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18.0,
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
