class ProductModel {
  late String? categoryId;
  late String? categoryImg;
  late String? categoryName;
  late String? descriptionNote;
  late List<dynamic>? descriptionItems; // Update the type to List<dynamic>?
  late String? descriptionPrice;
  late List<dynamic>? descriptionImg;
  late String? descriptioneventname;
  late String mainimg;


  ProductModel({
    required this.categoryId,
    required this.categoryImg,
    required this.categoryName,
    required this.descriptionNote,
    required this.descriptionItems,
    required this.descriptionPrice,
    required this.descriptionImg,
    required this.descriptioneventname,
    required this.mainimg,
  });

  // Convert JSON data to Dart objects
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      categoryId:json['categoryId'],
      categoryImg:json['categoryImg'],
      categoryName:json['categoryName'],
      descriptionNote: json['descriptionNote'],
      descriptionItems: json['descriptionItems'],
      descriptionPrice: json['descriptionPrice'],
      descriptionImg: json['descriptionImg'],
      descriptioneventname: json['descriptioneventname'],
      mainimg: json['mainimg'],
    );
  }

  // Convert Dart object to JSON data
  Map<String, dynamic> toJson() {
    return {
      'categoryId':categoryId,
      'categoryImg':categoryImg,
      'categoryName':categoryName,
      'descriptionNote': descriptionNote,
      'descriptionItems': descriptionItems,
      'descriptionPrice': descriptionPrice,
      'descriptionImg': descriptionImg,
      'descriptioneventname': descriptioneventname,
      'mainimg':mainimg,
    };
  }
}
