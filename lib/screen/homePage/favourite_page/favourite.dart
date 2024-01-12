import 'package:bridge_events/controller/FavoriteController/favConrollerNew.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import the package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/FavoriteModel/favoriteModel2.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  final FavController cartItemController = Get.put(FavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('favorite')
            .doc(user?.uid)
            .collection('favoriteItems')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
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
                  FavoriteFirebaseModel cartModel = FavoriteFirebaseModel(
                    mainimg: productData['mainimg'] ,
                    descriptioneventname: productData['descriptioneventname'].toString(),
                    descriptionPrice: productData['descriptionPrice'],
                  );

                  if (cartModel.mainimg != null && cartModel.mainimg!.isNotEmpty) {
                    return Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(children: [
                         ClipRRect(borderRadius: BorderRadius.circular(25),
                           child: Container(
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            height: 250,
                            child: CachedNetworkImage( // Use CachedNetworkImage widget
                              imageUrl: cartModel.mainimg.toString(),
                              placeholder: (context, url) => CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                        ),
                         ),
                      Positioned(left:180,top: 80,
                        child: Text(
                          cartModel.descriptioneventname.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Positioned(top: 120,left: 190,
                        child: Text(
                          cartModel.descriptionPrice.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ),

                        ],
                    ),
                    );
                  } else {
                    // Handle case where mainimg is null or empty
                    return Card(
                      color: Colors.red, // Change color as needed
                      child: Text("Invalid image URL"),
                    );
                  }
                },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
