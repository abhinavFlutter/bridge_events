class FavoriteFirebaseModel {
  late String? categoryId;
  late String? categoryImg;
  late String? categoryName;
  late String? descriptionPrice;
  late String? descriptioneventname;
  late String? mainimg;

  late String? descriptionNote;
  late List<dynamic>? descriptionItems;

  FavoriteFirebaseModel({
    required this.categoryId,
    required this.categoryImg,
    required this.categoryName,
    this.descriptionPrice,
    this.descriptioneventname,
    this.mainimg,
    this.descriptionNote,
    this.descriptionItems,
  });

  factory FavoriteFirebaseModel.fromJson(Map<String, dynamic> json) {
    return FavoriteFirebaseModel(
      categoryId:json['categoryId'],
      categoryImg:json['categoryImg'],
      categoryName:json['categoryName'],
      descriptionNote: json['descriptionNote'],
      descriptionItems: List.from(json['descriptionItems'] ?? []), // Use null-aware operator
      descriptionPrice: json['descriptionPrice'],
      descriptioneventname: json['descriptioneventname'],
      mainimg: json['mainimg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId':categoryId,
      'categoryImg':categoryImg,
      'categoryName':categoryName,
      'descriptionNote': descriptionNote,
      'descriptionItems': descriptionItems,
      'descriptionPrice': descriptionPrice,
      'descriptioneventname': descriptioneventname,
      'mainimg': mainimg,
    };
  }
}
