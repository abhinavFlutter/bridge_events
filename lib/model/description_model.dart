class DescriptionModel {
  late String? descriptionId;
  late String? descriptionNote;
  late List<dynamic>? descriptionItems; // Update the type to List<dynamic>?
  late String? descriptionPrice;
  late List<dynamic>? descriptionImages;

  DescriptionModel({
    required this.descriptionId,
    required this.descriptionNote,
    required this.descriptionItems,
    required this.descriptionPrice,
    required this.descriptionImages,
  });

  // Convert JSON data to Dart objects
  factory DescriptionModel.fromJson(Map<String, dynamic> json) {
    return DescriptionModel(
      descriptionId: json['descriptionId'],
      descriptionNote: json['descriptionNote'],
      descriptionItems: json['descriptionItems'],
      descriptionPrice: json['descriptionPrice'],
      descriptionImages: json['descriptionImages'],
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
    };
  }
}
