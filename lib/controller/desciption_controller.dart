
import 'package:bridge_events/model/description_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DescriptionController extends GetxController {
  Future<List<ProductModel>> getProducts(String parentDocId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('eventcategory')
          .doc('tlxAwqMSH0z3xfteh0cQ')
          .collection('allcategory')
          .get();

      List<ProductModel> products = [];

      for (QueryDocumentSnapshot productDoc in querySnapshot.docs) {
        Map<String, dynamic> productData = productDoc.data() as Map<String, dynamic>;

        // Include the document ID in the product data
        productData['documentId'] = productDoc.id;

        ProductModel productModel = ProductModel.fromJson(productData);
        print(productData);

        products.add(productModel);
      }

      print(products);
      return products; // Return the fetched data as a list of ProductModel
    } catch (e, stackTrace) {
      print('Error fetching product data: $e');
      print('Stack Trace: $stackTrace');
      return []; // Return an empty list in case of any errors
    }
  }


  Future<void> checkProductExistence(
      {required String uId, required ProductModel productModel}) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('eventcategory')
        .doc(uId)
        .collection('allcategory')
        .doc(productModel.categoryId.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      // Product already exists in the cart
      Get.snackbar("Product Exists", "This product is already in your cart.");
      print("Product exists");
    } else {
      // Product doesn't exist, add it to the cart
      await FirebaseFirestore.instance.collection('eventcategory').doc(uId).set(
        {
          'uId': uId,
          'createdAt': DateTime.now(),
        },
      );

      print("Product added");
      Get.snackbar("Success", "Product added to your cart.");
    }
  }
}
