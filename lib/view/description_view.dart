// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../controller/FavoriteController/favConrollerNew.dart';
// import '../controller/cartController.dart';
// import '../controller/desciption_controller.dart';
// import '../model/FavoriteModel/favoriteModel2.dart';
// import '../model/description_model.dart';
// import '../screen/booking_page/booking.dart';
//
// class DescriptionPage extends StatefulWidget {
//   const DescriptionPage({Key? key}) : super(key: key);
//
//   @override
//   State<DescriptionPage> createState() => _DescriptionPageState();
// }
//
// class _DescriptionPageState extends State<DescriptionPage> {
//   late List<QueryDocumentSnapshot<Object?>> data;
//   Map<int, int> selectedImageIndices = {};
//   final DescriptionController descriptionController =
//       Get.put(DescriptionController());
//   final FavoritrController2 _favorite2Controller =
//       Get.find<FavoritrController2>();
//   final FavController favController = FavController();
//   late User? user;
//   List<bool> isFavoriteList = [];
//
//   void makePhoneCall(String phoneNumber) async {
//     final url = 'tel:$phoneNumber';
//     try {
//       if (await canLaunch(url)) {
//         await launch(url, forceSafariVC: false);
//       } else {
//         throw 'Could not launch $url';
//       }
//     } catch (e) {
//       print('Error launching phone call: $e');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     user = FirebaseAuth.instance.currentUser;
//
//     descriptionController.getProducts(user!.uid).then((result) async {
//       setState(() {
//         data = result.cast<QueryDocumentSnapshot<Object?>>();
//
//         for (int i = 0; i < data.length; i++) {
//           selectedImageIndices[i] = 0;
//           isFavoriteList.add(false);
//         }
//       });
//
//       if (user != null) {
//         Map<String, List<String>>? favoriteData =
//             await favController.getCartData(user!.uid);
//         List<String> favoriteIds =
//             favoriteData?.values.expand((e) => e).toList() ?? [];
//
//         for (int i = 0; i < data.length; i++) {
//           if (favoriteIds.contains(data[i]['descriptionId'])) {
//             setState(() {
//               isFavoriteList[i] = true;
//             });
//           }
//         }
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: FutureBuilder<List<ProductModel>>(
//         future: descriptionController.getProducts(user!.uid),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (snapshot.data == null || snapshot.data!.isEmpty) {
//             return const Text('Loading.........');
//           }
//
//           List<ProductModel> products = snapshot.data!;
//           int dataLength = products.length;
//
//           return ListView.builder(
//             itemCount: dataLength,
//             itemBuilder: (context, index) {
//               ProductModel productModel = products[index];
//
//               return Column(
//                 children: [
//                   SizedBox(
//                     width: 370,
//                     height: 400,
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(25),
//                         child: Image(
//                           image: NetworkImage(
//                             productModel.descriptionImg![
//                                 selectedImageIndices[index] ?? 0],
//                           ),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 360,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 "Description",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 25,
//                                 ),
//                               ),
//                               const Padding(
//                                 padding: EdgeInsets.only(left: 40),
//                                 child: Icon(Icons.currency_rupee_sharp),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0),
//                                 child: Text(
//                                   "${productModel.descriptionPrice}",
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: Icon(
//                                   isFavoriteList[index]
//                                       ? Icons.favorite
//                                       : Icons.favorite_border,
//                                   size: 30,
//                                   color: Colors.redAccent,
//                                 ),
//                                 onPressed: () async {
//                                   setState(() {
//                                     isFavoriteList[index] ^= true;
//                                   });
//
//                                   FavoriteFirebaseModel favoriteItem =
//                                       FavoriteFirebaseModel(
//                                       categoryId: productModel.categoryId,
//                                     categoryName: productModel.categoryName,
//                                     categoryImg: productModel.categoryImg,
//                                     descriptionNote:
//                                         productModel.descriptionNote,
//                                     descriptionItems:
//                                         productModel.descriptionItems,
//                                     descriptionPrice:
//                                         productModel.descriptionPrice,
//                                     descriptioneventname:
//                                         productModel.descriptioneventname,
//                                     mainimg: productModel.mainimg,
//                                   );
//
//                                   if (isFavoriteList[index]) {
//                                     await favController.addFavoriteItem(
//                                       uId: user!.uid,
//                                       productModel: favoriteItem,
//                                     );
//                                   } else {
//                                     await favController.removeFavoriteItem(
//                                       uId: user!.uid,
//                                       favoriteItem: favoriteItem,
//                                     );
//                                   }
//
//                                   // Update the favorite list immediately after adding/removing
//                                   if (user != null) {
//                                     Map<String, List<String>>? favoriteData =
//                                         await favController
//                                             .getCartData(user!.uid);
//                                     List<String> favoriteIds = favoriteData
//                                             ?.values
//                                             .expand((e) => e)
//                                             .toList() ??
//                                         [];
//
//                                     for (int i = 0; i < data.length; i++) {
//                                       if (favoriteIds
//                                           .contains(data[i]['descriptionId'])) {
//                                         setState(() {
//                                           isFavoriteList[i] = isFavoriteList[i];
//                                         });
//                                       }
//                                     }
//                                   }
//                                 },
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 105,
//                     width: 365,
//                     child: Card(
//                       color: Colors.white54,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Text(
//                           "${productModel.descriptionNote}",
//                           style: const TextStyle(
//                             fontSize: 15,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15, left: 10),
//                     child: Text(
//                       productModel.descriptionItems?.join('\n') ?? '',
//                       style: const TextStyle(
//                         fontSize: 15,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 10, left: 10),
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 15),
//                         child: Row(
//                           children: [
//                             ...productModel.descriptionImg?.asMap().entries.map(
//                                   (entry) {
//                                     int imageIndex = entry.key;
//                                     String image = entry.value;
//
//                                     return InkWell(
//                                       onTap: () {
//                                         setState(() {
//                                           selectedImageIndices[index] =
//                                               imageIndex;
//                                         });
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                           right: 10,
//                                         ),
//                                         child: SizedBox(
//                                           height: 80,
//                                           width: 80,
//                                           child: Card(
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                             ),
//                                             child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(20.0),
//                                               child: Image.network(
//                                                 image,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ).toList() ??
//                                 [],
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 25, bottom: 10, left: 25, right: 25),
//                     child: SingleChildScrollView(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               makePhoneCall(
//                                   '+919747060806'); // Replace with your phone number
//                             },
//                             child: SizedBox(
//                               width: 150,
//                               height: 70,
//                               child: Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 color: Colors.black12,
//                                 elevation: 30,
//                                 child: const Center(
//                                   child: Text(
//                                     "Call Now",
//                                     style: TextStyle(
//                                       fontSize: 22,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               _favorite2Controller
//                                   .addedtoFavorite(productModel);
//
//                               return setState(() {
//                                 navigator?.push(MaterialPageRoute(
//                                   builder: (context) {
//                                     return Booking();
//                                   },
//                                 ));
//                               });
//                             },
//                             child: SizedBox(
//                               width: 150,
//                               height: 70,
//                               child: Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 color: Colors.black12,
//                                 elevation: 30,
//                                 child: const Center(
//                                   child: Text(
//                                     "Book Now",
//                                     style: TextStyle(
//                                       fontSize: 22,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const Divider(
//                     color: Colors.black,
//                     height: 50,
//                     thickness: 3,
//                     endIndent: 35,
//                     indent: 35,
//                   )
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
