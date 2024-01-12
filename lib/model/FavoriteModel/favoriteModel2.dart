class FavoriteFirebaseModel {
  late String? descriptionId;
  late String? descriptionPrice;
  late String? descriptioneventname;
  late String? mainimg;

  late String? descriptionNote;
  late List<dynamic>? descriptionItems;

  FavoriteFirebaseModel({
    this.descriptionId,
    this.descriptionPrice,
    this.descriptioneventname,
    this.mainimg,
    this.descriptionNote,
    this.descriptionItems,
  });

  factory FavoriteFirebaseModel.fromJson(Map<String, dynamic> json) {
    return FavoriteFirebaseModel(
      descriptionId: json['descriptionId'],
      descriptionNote: json['descriptionNote'],
      descriptionItems: List.from(json['descriptionItems'] ?? []), // Use null-aware operator
      descriptionPrice: json['descriptionPrice'],
      descriptioneventname: json['descriptioneventname'],
      mainimg: json['mainimg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'descriptionId': descriptionId,
      'descriptionNote': descriptionNote,
      'descriptionItems': descriptionItems,
      'descriptionPrice': descriptionPrice,
      'descriptioneventname': descriptioneventname,
      'mainimg': mainimg,
    };
  }
}
