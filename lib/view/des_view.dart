import 'package:bridge_events/view/vineethexample.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screen/booking_page/booking.dart';
import 'des_controller.dart';

class DescriptionPage extends StatefulWidget {
  final String documentId;
  final String categoryName;
  final String categoryImage;
  final List<DocumentSnapshot> allEventsData;
  final User? user;

  const DescriptionPage({
    Key? key,
    required this.documentId,
    required this.categoryName,
    required this.categoryImage,
    required this.allEventsData,
    required this.user,
  }) : super(key: key);

  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  List<int> selectedImageIndices = [];
  late User? user;
  Set<String> favoriteItems = Set<String>();
  final AlleventsController _alleventsController = AlleventsController();
  bool isFavorite = false;
  late CollectionReference _userFavoritesCollection;

  Future<void> loadFavoriteStatus() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      final userFavoriteDoc =
      await _userFavoritesCollection.doc(currentUser.uid).get();

      setState(() {
        isFavorite = userFavoriteDoc.exists;
        isFavorite = true;
        print("**********************************************************");
        print("User favorite document exists: $isFavorite");
        print("User UID: ${currentUser.uid}");
        print("Document data: ${userFavoriteDoc.data()}");
      });
    } else {
      setState(() {
        isFavorite = false;
      });
    }
  }

  Future<void> saveFavoriteStatus(bool status) async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      if (status) {
        await _userFavoritesCollection.doc(currentUser.uid).set({
          'pid': widget.allEventsData.first['pid'],
          'price': widget.allEventsData.first['price'],
          'pimage': widget.allEventsData.first['pimage'],
          'des': widget.allEventsData.first['des'],
          // Add other fields as needed
        });
        isFavorite = true;
        print(currentUser);
      } else {
        await _userFavoritesCollection.doc(currentUser.uid).delete();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    user = widget.user;

    // Initialize _userFavoritesCollection once
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    _userFavoritesCollection = _firestore.collection('userfavourite'); // Remove 'CollectionReference' from here

    loadFavoriteStatus();

    for (int i = 0; i < widget.allEventsData.length; i++) {
      selectedImageIndices.add(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  for (final eventData in widget.allEventsData) ...[
                    _buildEventCard(eventData),
                    const SizedBox(height: 16.0),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(DocumentSnapshot eventData) {
    final pid = eventData['pid'];
    final price = eventData['price'];
    final pimages = eventData['pimage'] as List<dynamic>;
    final des = eventData['des'];
    final pitems = eventData['pitems'] as List<dynamic>;
    final pname = eventData['pname'];

    final int productIndex = widget.allEventsData.indexOf(eventData);
    final String productId = eventData['pid'];

    isFavorite = favoriteItems.contains(productId);

    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedImageIndices[productIndex] = 0;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: SizedBox(
                  width: 370,
                  height: 400,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: CachedNetworkImage(
                        imageUrl: pimages.isNotEmpty
                            ? pimages[selectedImageIndices[productIndex]] as String
                            : 'default_image_url',
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Lottie.asset(
                              'assets/json/loading.json',
                              repeat: true,
                              reverse: false,
                              animate: true,
                            ),
                          ), // Circular Progress Indicator
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 45, left: 10),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ),
                const Icon(Icons.currency_rupee_outlined),
                Text(
                  "${price}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Color.fromARGB(200, 200, 0, 100),
                    size: 30,
                  ),
                  onPressed: () {
                    // Toggle the favorite status
                    toggleFavorite(productId);

                    // Save the updated favorite status using SharedPreferences
                    saveFavoriteStatus(!isFavorite);

                    // Add or remove the item from the userfavourite collection
                    if (isFavorite) {
                      // add item from the collection
                      _userFavoritesCollection.doc(productId).set({
                        'pid': pid,
                        'price': price,
                        'pimage': pimages,
                        'des': des,
                        'pname': pname,
                        // Add other fields as needed
                      });
                      isFavorite = true;

                    } else {
                      // remove item to the collection
                      _userFavoritesCollection.doc(productId).delete();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  height: 140,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(192, 192, 192, 192),
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      "${des}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pitems.map(
                    (item) => Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 4),
                  child: Text(
                    "$item",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ).toList(),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 100,
              child: SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pimages.length,
                  itemBuilder: (context, imageIndex) {
                    final imageUrl = pimages[imageIndex] as String;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImageIndices[productIndex] = imageIndex;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 90,
                          width: 80,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      makePhoneCall(
                          '+919747060806'); // Replace with your phone number
                    },
                    child: SizedBox(
                      width: 150,
                      height: 70,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.black12,
                        elevation: 30,
                        child: const Center(
                          child: Text(
                            "Call Now",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      return setState(() {
                        navigator?.push(MaterialPageRoute(
                          builder: (context) {
                            return Booking();
                          },
                        ));
                      });
                    },
                    child: SizedBox(
                      width: 150,
                      height: 70,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.black12,
                        elevation: 30,
                        child: const Center(
                          child: Text(
                            "Book Now",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
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
  }

  void toggleFavorite(String productId) {
    setState(() {
      if (favoriteItems.contains(productId)) {
        // Item is already in favorites, remove it
        favoriteItems.remove(productId);
        isFavorite = false;
      } else {
        // Item is not in favorites, add it
        favoriteItems.add(productId);
        isFavorite = true;
      }
    });
  }
}
