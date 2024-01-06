// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/cartController.dart';
// import '../../model/description_model.dart';
//
// class CartPage extends StatelessWidget {
//   final CartController cartController = Get.put(CartController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body:
//       Obx(
//             () => ListView.builder(
//           itemCount: cartController.cartItems.length,
//           itemBuilder: (context, index) {
//             DescriptionModel item = cartController.cartItems[index];
//             return ListTile(
//               title: Text(item.descriptionNote ?? ''),
//               subtitle: Text('Quantity: ${item.descriptionItems}'),
//               // Add more details as needed
//             );
//           },
//         ),
//       ),
//
//     );
//   }
// }
