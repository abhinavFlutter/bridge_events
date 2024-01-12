import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/FavoriteModel/favoriteModel2.dart';

class FavController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addFavoriteItem({
    required String uId,
    required FavoriteFirebaseModel productModel,
  }) async {
    try {
      await _firestore
          .collection('favorite')
          .doc(uId)
          .collection('favoriteItems')
          .add(productModel.toJson());
    } catch (error) {
      // Handle error
      print('Error adding favorite item: $error');
    }
  }


  Future<Map<String, List<String>>?> getCartData(String uid) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('favorite')
          .get();

      Map<String, List<String>> cartOrdersDataMap = {};

      for (QueryDocumentSnapshot cartDoc in querySnapshot.docs) {
        String cartDocumentID = cartDoc.id;

        QuerySnapshot cartOrdersSnapshot = await FirebaseFirestore.instance
            .collection('favorite')
            .doc(cartDocumentID)
            .collection('favoriteItems')
            .get();

        List<String> cartOrderIDs = cartOrdersSnapshot.docs
            .map((doc) => doc.id)
            .toList();

        cartOrdersDataMap[cartDocumentID] = cartOrderIDs;
      }

      if (cartOrdersDataMap.isNotEmpty) {
        return cartOrdersDataMap; // Return the fetched data in Map format
      }


      else {
        print('No cart orders data found.');
        return null; // Return null if no data found
      }
    } catch (e, stackTrace) {
      print('Error fetching cart orders data: $e');
      print('Stack Trace: $stackTrace');
      return null; // Return null in case of any errors
    }
  }
  // Future<Map<String, List<String>>?> getCartData() async {
  //   try {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('favorite')
  //         .get();
  //
  //     Map<String, List<String>> cartOrdersDataMap = {};
  //
  //     for (QueryDocumentSnapshot cartDoc in querySnapshot.docs) {
  //       String cartDocumentID = cartDoc.id;
  //
  //       QuerySnapshot cartOrdersSnapshot = await FirebaseFirestore.instance
  //           .collection('favorite')
  //           .doc(cartDocumentID)
  //           .collection('favoriteItems')
  //           .get();
  //
  //       List<String> cartOrderIDs = cartOrdersSnapshot.docs
  //           .map((doc) => doc.id)
  //           .toList();
  //
  //       cartOrdersDataMap[cartDocumentID] = cartOrderIDs;
  //     }
  //
  //     if (cartOrdersDataMap.isNotEmpty) {
  //       return cartOrdersDataMap; // Return the fetched data in Map format
  //     } else {
  //       print('No cart orders data found.');
  //       return null; // Return null if no data found
  //     }
  //   } catch (e, stackTrace) {
  //     print('Error fetching cart orders data: $e');
  //     print('Stack Trace: $stackTrace');
  //     return null; // Return null in case of any errors
  //   }
  // }


  Future<void> removeFavoriteItem({
    required String uId,
    required FavoriteFirebaseModel favoriteItem,
  }) async {
    try {
      await _firestore
          .collection('favorite')
          .doc(uId)
          .collection('favoriteItems')
          .doc(favoriteItem.descriptionId) // Assuming descriptionId is a unique identifier
          .delete();
    } catch (error) {
      // Handle error
      print('Error removing favorite item: $error');
    }
  }



}