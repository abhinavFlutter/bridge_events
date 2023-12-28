// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import '../../model/cart_model/cartModel.dart';
//
// import '../../model/description_model.dart';
// import '../../model/event_category_model.dart'; // Import the EventCategoryModel class
//
// class CartItemController extends GetxController {
//   Future<void> checkProductExistence({
//     required String uId,
//     int quantityIncrement = 1,
//     required DescriptionModel DescriptionModel,
//     required EventCategoryModel
//         eventCategoryModel, // Pass an instance of EventCategoryModel
//   }) async {
//     final DocumentReference documentReference = FirebaseFirestore.instance
//         .collection('cart')
//         .doc(uId)
//         .collection('cartOrders')
//         .doc(DescriptionModel.descriptionId.toString());
//
//     DocumentSnapshot snapshot = await documentReference.get();
//
//     if (snapshot.exists) {
//       // Product already exists in the cart, you can update quantity or do something else
//       print("Product already exists in the cart");
//       Get.snackbar("Info", "Product already exists in the cart");
//     } else {
//       // Product doesn't exist in the cart, you can add it
//       CartModel cartModel = CartModel(
//         categoryId: eventCategoryModel.categoryId,
//         categoryName: eventCategoryModel.categoryName,
//         categoryImg: eventCategoryModel.categoryImg,
//         descriptionId: DescriptionModel.descriptionId,
//         descriptionNote: DescriptionModel.descriptionNote,
//         descriptionItems: DescriptionModel.descriptionItems,
//         descriptionPrice: DescriptionModel.descriptionPrice,
//         descriptionImages: DescriptionModel.descriptionImages,
//       );
//
//       await documentReference.set(cartModel.toMap());
//
//       print("Product added");
//       Get.snackbar("Success", "Product added");
//     }
//   }
// }
