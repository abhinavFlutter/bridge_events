class ProductModel {
  late String? descriptionId;
  late String? descriptionNote;
  late List<dynamic>? descriptionItems; // Update the type to List<dynamic>?
  late String? descriptionPrice;
  late List<dynamic>? descriptionImages;
  late String? descriptioneventname;
  late String mainimg;

  ProductModel({
    required this.descriptionId,
    required this.descriptionNote,
    required this.descriptionItems,
    required this.descriptionPrice,
    required this.descriptionImages,
    required this.descriptioneventname,
    required this.mainimg,
  });

  // Convert JSON data to Dart objects
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      descriptionId: json['descriptionId'],
      descriptionNote: json['descriptionNote'],
      descriptionItems: json['descriptionItems'],
      descriptionPrice: json['descriptionPrice'],
      descriptionImages: json['descriptionImages'],
      descriptioneventname: json['descriptioneventname'],
      mainimg: json['mainimg'],
    );
  }

  // Convert Dart object to JSON data
  Map<String, dynamic> toJson() {
    return {
      'descriptionId': descriptionId,
      'descriptionNote': descriptionNote,
      'descriptionItems': descriptionItems,
      'descriptionPrice': descriptionPrice,
      'descriptionImages': descriptionImages,
      'descriptioneventname': descriptioneventname,
      'mainimg':mainimg,
    };
  }
}
