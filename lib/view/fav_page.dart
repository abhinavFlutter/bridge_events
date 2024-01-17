import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('userfavourite').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return const Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No products found!"),
            );
          }

          if (snapshot.data != null) {
            return SizedBox(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final productData = snapshot.data!.docs[index];

                  return _buildFavoriteItem(productData);
                },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget _buildFavoriteItem(DocumentSnapshot document) {
    // Perform null checks or provide default values if needed
    final pid = document['pid'] ?? "";
    final price = document['price'] ?? 0.0;
    final pimageList = document['pimage'] as List<dynamic>?;

    // Check if pimageList is not null and contains at least one image
    final pimage = (pimageList != null && pimageList.isNotEmpty) ? pimageList[0] : "";

    final des = document['des'] ?? "";
    final pname = document['pname'] ?? "";

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart, // Swipe from right to left
      onDismissed: (direction) {
        // Handle the dismiss action (remove the item from Firestore)
        FirebaseFirestore.instance
            .collection('userfavourite')
            .doc(document.id)
            .delete()
            .then((_) {
          print('Document successfully deleted!');
        }).catchError((error) {
          print('Error deleting document: $error');
        });
      },
      background: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.white30, Colors.redAccent], // Adjust the colors as needed
          ),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(
          Icons.delete,size: 30,
          color: Colors.black,
        ),
      ),
      child: Card(
        color: Colors.white,
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 250,
                child: SizedBox(
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl: pimage.toString(),
                    placeholder: (context, url) => CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(left: 220,top: 10,
              child: SizedBox(
                  width: 100,height: 40,
                  child: Lottie.asset('assets/json/star.json')),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 220, top: 40),
              child: Column(
                children: [

                  Text(
                    pname.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '\u20B9 $price', // Using Unicode character for Indian Rupee symbol
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  Center(
                    child: Text(
                      des.toString(),
                      style: const TextStyle(
                        fontSize: 13,
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
}
