// import 'dart:convert';
//
// class CartModel {
//   late String? categoryId;
//   late String? categoryName;
//   late String? categoryImg;
//   late String? descriptionId;
//   late String? descriptionNote;
//   late List<dynamic>? descriptionItems;
//   late String? descriptionPrice;
//   late List<dynamic>? descriptionImages;
//
//   CartModel({
//     required this.descriptionId,
//     required this.descriptionNote,
//     required this.descriptionItems,
//     required this.descriptionPrice,
//     required this.descriptionImages,
//     required this.categoryId,
//     required this.categoryName,
//     required this.categoryImg,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'descriptionId': this.descriptionId,
//       'descriptionNote': this.descriptionNote,
//       'descriptionItems': this.descriptionItems,
//       'descriptionPrice': this.descriptionPrice,
//       'descriptionImages': this.descriptionImages,
//       'categoryId': this.categoryId,
//       'categoryName': this.categoryName,
//       'categoryImg': this.categoryImg,
//     };
//   }
//
//   factory CartModel.fromMap(Map<String, dynamic> json) {
//     return CartModel(
//       descriptionId: json['descriptionId'],
//       descriptionNote: json['descriptionNote'],
//       descriptionItems: json['descriptionItems'],
//       descriptionPrice: json['descriptionPrice'],
//       descriptionImages: json['descriptionImages'],
//       categoryId: json['categoryId'],
//       categoryName: json['categoryName'],
//       categoryImg: json['categoryImg'],
//     );
//   }
// }
