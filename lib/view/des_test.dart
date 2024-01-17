// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import 'des_controller.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DescriptionModel {
//   final String cid;
//   final String pid;
//   final List<String> pimage;
//   final String price;
//   final String cimage; // Added cimage field
//
//   DescriptionModel({
//     required this.cid,
//     required this.pid,
//     required this.pimage,
//     required this.price,
//     required this.cimage,
//   });
//
//   factory DescriptionModel.fromMap(Map<String, dynamic> map) {
//     return DescriptionModel(
//       cid: map['cid'] is DocumentReference
//           ? (map['cid'] as DocumentReference).id
//           : map['cid'] ?? '',
//       pid: map['pid'] ?? '',
//       pimage: List<String>.from(map['pimage'] ?? []),
//       price: map['price'] ?? '',
//       cimage: map['cimage'] ?? '', // Set the default value or handle null as needed
//     );
//   }
// }
//
// class AlleventsPage extends StatelessWidget {
//   final AlleventsController _alleventsController = AlleventsController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Allevents Page'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _alleventsController.getAlleventsStream(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Text('No categories found');
//           } else {
//             QuerySnapshot querySnapshot = snapshot.data!;
//             List<QueryDocumentSnapshot> documents = querySnapshot.docs;
//             return GridView.builder(
//               itemCount: documents.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 20.0,
//                 crossAxisSpacing: 20.0,
//               ),
//               itemBuilder: (BuildContext context, int index) {
//                 QueryDocumentSnapshot document = documents[index];
//                 Map<String, dynamic> documentData = document.data() as Map<
//                     String,
//                     dynamic>;
//
//                 String documentId = document.id;
//                 String cName = documentData['cname'] ?? '';
//                 String cImage = documentData['cimage'] ??
//                     ''; // Extract cimage from documentData
//
//                 return ListTile(
//                   title: Text('Document ID: $documentId'),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Category Name: $cName'),
//                       Text('Category Image: $cImage'), // Display Category Image
//                     ],
//                   ),
//                 );
//               }
// //                         , itemBuilder: (context, index) {
//             );
//             // return ListView.builder(
//             //   itemCount: documents.length,
//             //   itemBuilder: (context, index) {
//             //     QueryDocumentSnapshot document = documents[index];
//             //     Map<String, dynamic> documentData = document.data() as Map<String, dynamic>;
//             //
//             //     String documentId = document.id;
//             //     String cName = documentData['cname'] ?? '';
//             //     List<DocumentReference> productRefs = List<DocumentReference>.from(documentData['products'] ?? []);
//             //
//             //     return Column(
//             //       crossAxisAlignment: CrossAxisAlignment.start,
//             //       children: [
//             //         ListTile(
//             //           title: Text('Document ID: $documentId'),
//             //           subtitle: Column(
//             //             crossAxisAlignment: CrossAxisAlignment.start,
//             //             children: [
//             //               Text('Category Name: $cName'),
//             //             ],
//             //           ),
//             //         ),
//             //         FutureBuilder<List<DescriptionModel>>(
//             //           future: fetchProducts(productRefs),
//             //           builder: (context, snapshot) {
//             //             if (snapshot.connectionState == ConnectionState.waiting) {
//             //               return CircularProgressIndicator();
//             //             } else if (snapshot.hasError) {
//             //               return Text('Error: ${snapshot.error}');
//             //             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             //               return Text('No products found');
//             //             } else {
//             //               List<DescriptionModel> products = snapshot.data!;
//             //               return Column(
//             //                 children: products.map((product) {
//             //                   return ListTile(
//             //                     title: Text('Product ID: ${product.pid}'),
//             //                     subtitle: Column(
//             //                       crossAxisAlignment: CrossAxisAlignment.start,
//             //                       children: [
//             //                         Text('Price: ${product.price}'),
//             //                         // Other product details as needed
//             //                       ],
//             //                     ),
//             //                   );
//             //                 }).toList(),
//             //               );
//             //             }
//             //           },
//             //         ),
//             //       ],
//             //     );
//             //   },
//             // );
//           }
//         },
//       ),
//     );
//   }
//
//   Future<List<DescriptionModel>> fetchProducts(
//       List<DocumentReference> productRefs) async {
//     List<DescriptionModel> products = [];
//     for (var productRef in productRefs) {
//       DocumentSnapshot productSnapshot = await productRef.get();
//       Map<String, dynamic> productData =
//           productSnapshot.data() as Map<String, dynamic>;
//       DescriptionModel product = DescriptionModel.fromMap(productData);
//       products.add(product);
//     }
//     return products;
//   }
// }
